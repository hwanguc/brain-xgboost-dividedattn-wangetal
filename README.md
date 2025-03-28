# brain-xgboost-dividedattn-wangetal

This respiratory contains the R, MATLAB, and Python code for analysing the behavioural (GLMM, correlation) and fMRI data (GLM, XGBoost) and generating the figures for Wang et al. (under review). Behavioural data and beta estimates from the first-level fMRI model are available, but neuroimages will be provided upon adequate requests.

**_./1_analysis_behavioural/_** - GLMM Models for behavioural data of the fMRI task, and brain-behvioural correlations.

**_./2_analysis_fmri_glm/_** - First- and second-level general linear models for fMRI data.

**_./3_analysis_fmri_xgboost/_** - XGBoost modelling for fMRI data.

**Tables and Fugures**

**_./1_analysis_behavioural/glmm.R_**: Tables 2, 3, 4, 5, B2; Figs. 5, 6.

**_./1_analysis_behavioural/descriptive.R_**:  Figs 3, 4, C1.

**_./1_analysis_behavioural/corr_analysis.R_**: Figs. 7B, 8A, 8B, C2.

**_./1_analysis_behavioural/binomial_test.R_**: Figs. 9A, 12A.

**_./2_analysis_fmri_glm/2ndLevel/con_0014.nii_**: Fig. 7A (Please load an overley onto MNI 152 template in MRIcroGL).

**_./2_analysis_fmri_glm/2ndLevel/SPM.mat_**: Table 6 (Please load in SPM12.6).

**_./3_analysis_fmri_xgboost/xgboost_dividedattn_v3.ipynb**: Figs 9B, 10, 11A, 11B, 12B, C3; Table 7 (please run model inference for the four binomial classification models).



