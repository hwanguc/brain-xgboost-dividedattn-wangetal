% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'E:\Backup\230518_study3_fMRI\data-brain-glm-dividedattn-wangetal\reanalysis_BUCNI_23subj\scripts\hans_project\RunPreproc_1stLevel_6run_withanat_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
