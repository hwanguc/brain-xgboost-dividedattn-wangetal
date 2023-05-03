# import packages and functions

import os

import numpy as np
import pandas as pd
import os.path as op
from glob import glob
import re

import nibabel as nib
from nibabel.testing import data_path

import nilearn
from nilearn import plotting
from nilearn import image

from sklearn.model_selection import GridSearchCV, StratifiedShuffleSplit
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.pipeline import Pipeline
from sklearn.metrics import roc_auc_score, confusion_matrix 
from sklearn.feature_selection import VarianceThreshold

import xgboost as xgb
from xgboost.sklearn import XGBClassifier


import copy as cp
import seaborn as sns
from typing import Tuple
from sklearn.metrics import confusion_matrix
import scipy.stats
from collections import Counter

import matplotlib.pyplot as plt
plt.style.use('classic')


import warnings
warnings.filterwarnings("ignore")

# data curation and cleaning

## spreadsheet
dat_spmt = pd.read_csv('/Users/hanwang/Desktop/data_temp/data-brain-xgboost-dividedattn-wangetal/dat_all/dat_spmt.csv')

## read the spmt files
dir_spmt = '/Users/hanwang/Desktop/data_temp/data-brain-xgboost-dividedattn-wangetal/dat_all/'
spmt_files = [dir_spmt + file for file in dat_spmt.filename]

## confirm that all spmT files have the same dimensions as the first file (and therefore are all of equal dimensions)
all(nib.load(x).shape == nib.load(spmt_files[0]).shape for x in spmt_files)

## get the file dimensions
voxel_dims = nib.load(spmt_files[0]).shape
voxel_dims

##　data QA: how many voxels are non-zero? unravel the matrix, sort, print the number of non-zero values and 10 highest values
t_stats = np.zeros((len(spmt_files), np.prod(voxel_dims)))

for idx, tstat_file in enumerate(spmt_files):
  
    data = nib.load(tstat_file).get_data()
    t_stat = data.ravel()
    max_10 = np.sort(t_stat)
    non_zero = [x for x in t_stat if x != 0]
    sub_ID = dat_spmt.filename[idx]
    print(sub_ID, "non zero voxels: ", len(non_zero), " 10 max values: ", max_10[:20])

## define fine the functional parcellations on the atlas
from nilearn.datasets import fetch_atlas_schaefer_2018
### It can return different number of ROIs; we'll set it to 100
n_rois = 100
schaefer_parc = fetch_atlas_schaefer_2018(n_rois = n_rois, resolution_mm=2, yeo_networks=17, verbose=False)
### Insert Background label under the index 0 because it is missing in the array
schaefer_parc.labels = np.insert(schaefer_parc.labels, 0, 'Background')


## a dict mapping indices to anatomical labels
labels_dict_100 = dict(enumerate(schaefer_parc.labels))

## a list of the labels
feat_names_100 = schaefer_parc.labels.tolist()
feat_names_100 = [x.decode('UTF-8') for x in feat_names_100]


## resampling of the schaefer map so it is the same size as our input images

### set interpolation to nearest, because we're dealing with discrete integers
schaefer_rois = image.resample_to_img(schaefer_parc['maps'],spmt_files[0], interpolation='nearest')
print("Shape of the resampled ROI map: {}".format(schaefer_rois.shape))
plotting.plot_roi(schaefer_rois)

### check how many functional parcellations are there in the atlas
roin_ints = schaefer_rois.get_fdata()
np.unique(roin_ints)


## pre-processing: get an average value for each roi in the input images, so we have an output of 100 * 101 as the output, which we will use as X for the XGBoost algorithm.
from nilearn.input_data import NiftiLabelsMasker
label_masker = NiftiLabelsMasker(labels_img=schaefer_rois, strategy='mean') # this func is defined to take the mean of each roi

def average_roi(spm_file):
  label_masker.fit(spm_file)
  averaged_roi = label_masker.transform(spm_file)
  return averaged_roi


X_100 = np.zeros((len(spmt_files), n_rois))

for idx, tstat in enumerate(spmt_files):
    # average ROIs for each file and add in new row of matrix X
    avg_roi = average_roi(tstat)
    X_100[idx,:] = avg_roi

X_100 = np.insert(X_100, 0, np.zeros(len(spmt_files)), axis=1)

## plot the average functional image for each task condition
# get a separate list of spmt files for each condition
spmt_files_aeve = [spmt for idx, spmt in enumerate(spmt_files) if dat_spmt.label[idx] == 'aeve']
spmt_files_aevh = [spmt for idx, spmt in enumerate(spmt_files) if dat_spmt.label[idx] == 'aevh']
spmt_files_ahve = [spmt for idx, spmt in enumerate(spmt_files) if dat_spmt.label[idx] == 'ahve']
spmt_files_ahvh = [spmt for idx, spmt in enumerate(spmt_files) if dat_spmt.label[idx] == 'ahvh']

func_mean_aeve = image.mean_img(spmt_files_aeve)
func_mean_aevh = image.mean_img(spmt_files_aevh)
func_mean_ahve = image.mean_img(spmt_files_ahve)
func_mean_ahvh = image.mean_img(spmt_files_ahvh)

plotting.view_img_on_surf(
    stat_map_img=func_mean_aeve,
    surf_mesh='fsaverage5', threshold='75%')

plotting.view_img_on_surf(
    stat_map_img=func_mean_aevh,
    surf_mesh='fsaverage5', threshold='75%')

plotting.view_img_on_surf(
    stat_map_img=func_mean_ahve,
    surf_mesh='fsaverage5', threshold='75%')

plotting.view_img_on_surf(
    stat_map_img=func_mean_ahvh,
    surf_mesh='fsaverage5', threshold='75%')

## encode labels as numbers

le = LabelEncoder()
le.fit(dat_spmt.label)
y = le.transform(dat_spmt.label)
y


# MODEL

## the model

xgb_model = xgb.XGBClassifier()
scaler = StandardScaler()

from sklearn.pipeline import Pipeline

pipeline_to_make = [('varthres', VarianceThreshold()),
                    ('preproc', scaler),
                    ('xgb_model', xgb_model)]

my_pipe = Pipeline(pipeline_to_make)

sss = StratifiedShuffleSplit(n_splits=2, test_size=0.2, random_state=100)


## hyperparameters: the grid should be stored as a dictionary
hyper_grid = {
    'xgb_model__max_depth': np.arange(3, 6, 1),        #python range end is not inclusive
    'xgb_model__learning_rate': np.arange(0.01, 0.08, 0.03),
    'xgb_model__gamma': np.arange(0, 2, 1),
    'xgb_model__colsample_bytree': np.arange(0.3, 0.7, 0.2),
    'xgb_model__n_estimators': np.arange(150, 251, 50)
}

## fit the model
CV = GridSearchCV(my_pipe, hyper_grid, verbose=4, cv=sss, error_score = 'raise')
CV.fit(X_100, y)


best_score = CV.best_score_
print("Best parameters: ", CV.best_params_)    
print("Best score: ", best_score)
best_model = CV.best_estimator_
tuned_xgb = best_model['xgb_model']