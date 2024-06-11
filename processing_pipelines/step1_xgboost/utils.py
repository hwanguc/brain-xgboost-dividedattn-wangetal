import numpy as np
from typing import Tuple
import copy as cp
import seaborn as sns
from typing import Tuple
from sklearn.metrics import confusion_matrix
import matplotlib.pyplot as plt
plt.style.use('seaborn-bright')
#plt.figure(facecolor='white')

import nilearn
from nilearn import plotting
from nilearn import image


def average_roi(label_masker, spm_file):
  label_masker.fit(spm_file)
  averaged_roi = label_masker.transform(spm_file)
  return averaged_roi



def cross_val_predict(model, kfold, X: np.array, y: np.array) -> Tuple[np.array, np.array, np.array]:
    model_ = cp.deepcopy(model)
    no_classes = len(np.unique(y))
    actual_classes = np.empty([0], dtype=int)
    predicted_classes = np.empty([0], dtype=int)
    predicted_proba = np.empty([0, no_classes]) 

    for train_ndx, test_ndx in kfold.split(X, y):
        train_X, train_y, test_X, test_y = X[train_ndx], y[train_ndx], X[test_ndx], y[test_ndx]
        actual_classes = np.append(actual_classes, test_y)
        model_.fit(train_X, train_y)
    

        predicted_classes = np.append(predicted_classes, model_.predict(test_X))
        try:
            predicted_proba = np.append(predicted_proba, model_.predict_proba(test_X), axis=0)
        except:
            predicted_proba = np.append(predicted_proba, np.zeros((len(test_X), no_classes), dtype=float), axis=0)

    return actual_classes, predicted_classes, predicted_proba



def plot_confusion_matrix(actual_classes: np.array, predicted_classes: np.array, sorted_labels: list):
    matrix = confusion_matrix(actual_classes, predicted_classes, labels=sorted_labels)
    sorted_labels = ['aeve', 'aevh', 'ahve', 'ahvh']
    plt.figure(figsize=(12.8,6))
    sns.heatmap(matrix, annot=True, xticklabels=sorted_labels, yticklabels=sorted_labels, cmap="Blues", fmt="g")
    plt.xlabel('Predicted'); plt.ylabel('Actual'); plt.title('Confusion Matrix')

    plt.show()


def single_roi(id_matrix, roi_name, f_names, ref_img):
  #id_to_name = dict(enumerate(f_names))
  name_to_id = dict((v, k) for k, v in dict(enumerate(f_names)).items())
  id = name_to_id[roi_name]
  id_mat = id_matrix.copy()
  # replace the ROI indices with 1, set everything else to 0
  with np.nditer(id_mat, op_flags=['readwrite']) as identity:
    for voxel in identity:
      if int(voxel) == id:
        voxel[...] = 100
      else:
        voxel[...] = 0

  # convert the 3D array to nifti format 
  single_roi_mask = nilearn.image.new_img_like(ref_img, id_mat, affine=None, copy_header=False)

  nilearn.plotting.plot_roi(single_roi_mask, title=roi_name)
  plt.show()


  

def compare_boxplots(feat_name, df_aeve, df_aevh, df_ahve, df_ahvh):
    aeve_col = df_aeve[feat_name]
    aevh_col = df_aevh[feat_name]
    ahve_col = df_ahve[feat_name]
    ahvh_col = df_ahvh[feat_name]
    figgg, axxx = plt.subplots()
    axxx.set_title(feat_name)
    ax = axxx.boxplot([aeve_col, aevh_col, ahve_col, ahvh_col], patch_artist=True)
    plt.xticks([1, 2, 3, 4], ["aeve", "aevh", "ahve", "ahvh"])
    colors = ['lightblue', 'lightgreen', 'lightpink', 'lightyellow']
    for bplot in ax:
        for patch, color in zip(ax['boxes'], colors):
            patch.set_facecolor(color)
    plt.show()

