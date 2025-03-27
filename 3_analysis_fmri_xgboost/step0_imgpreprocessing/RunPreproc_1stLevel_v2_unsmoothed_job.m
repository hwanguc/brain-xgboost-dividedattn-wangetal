%-----------------------------------------------------------------------
% Job saved on 23-Sep-2022 15:16:49 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------

% Script created by Han Wang, 24 Sep 2022.

subjects = [02 03 04 05 07 08 09 10 11 13 14 15 16 17 18 19 20 21 22 23 24 25]; % Replace with a list of all of the subjects you wish to analyze
runs = [1 2 3 4 5 6];

user = getenv('USER'); % Will return the username for OSX operating systems; change to 'USERNAME' for Windows

for subject=subjects
    
subject = num2str(subject, '%02d'); % Zero-pads each number so that the subject ID is 2 characters long

%%%%%%%%%%

% Check whether the files have been unzipped. If not, unzip them using
% gunzip

for runno = runs
    
    runno = num2str(runno);

    if isfile(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\sub' subject '-run' runno '_bold.nii']) == 0
        display(['Run ' runno ' has not been unzipped; unzipping now'])
        gunzip(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\sub' subject '-run' runno '_bold.nii.gz'])
    else
        display(['Run ' runno ' is already unzipped; doing nothing'])
    end
    
end



if isfile(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\anat\sub-' subject '_t1.nii']) == 0
    display('Anatomical image has not been unzipped; unzipping now')
    gunzip(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\anat\sub-' subject '_t1.nii.gz'])
else
    display('Anatomical image is already unzipped; doing nothing')
end

%%%%%%%%%%

% Execute the code specified in the SPM GUI


matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'run1_to_run6files';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {
                                                                     {['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\sub' subject '-run1_bold.nii']}
                                                                     {['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\sub' subject '-run2_bold.nii']}
                                                                     {['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\sub' subject '-run3_bold.nii']}
                                                                     {['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\sub' subject '-run4_bold.nii']}
                                                                     {['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\sub' subject '-run5_bold.nii']}
                                                                     {['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\sub' subject '-run6_bold.nii']}
                                                                     }';
matlabbatch{2}.spm.spatial.realign.estwrite.data{1}(1) = cfg_dep('Named File Selector: run1_to_run6files(1) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{2}.spm.spatial.realign.estwrite.data{2}(1) = cfg_dep('Named File Selector: run1_to_run6files(2) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{2}));
matlabbatch{2}.spm.spatial.realign.estwrite.data{3}(1) = cfg_dep('Named File Selector: run1_to_run6files(3) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{3}));
matlabbatch{2}.spm.spatial.realign.estwrite.data{4}(1) = cfg_dep('Named File Selector: run1_to_run6files(4) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{4}));
matlabbatch{2}.spm.spatial.realign.estwrite.data{5}(1) = cfg_dep('Named File Selector: run1_to_run6files(5) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{5}));
matlabbatch{2}.spm.spatial.realign.estwrite.data{6}(1) = cfg_dep('Named File Selector: run1_to_run6files(6) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{6}));
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.sep = 4;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.rtm = 1;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.interp = 2;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.weight = '';
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.which = [2 1];
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.interp = 4;
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.mask = 1;
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.prefix = 'r';
matlabbatch{3}.spm.spatial.coreg.estwrite.ref(1) = cfg_dep('Realign: Estimate & Reslice: Mean Image', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','rmean'));
matlabbatch{3}.spm.spatial.coreg.estwrite.source = {['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\anat\sub-' subject '_t1.nii,1']};
matlabbatch{3}.spm.spatial.coreg.estwrite.other = {''};
matlabbatch{3}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch{3}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch{3}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{3}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch{3}.spm.spatial.coreg.estwrite.roptions.interp = 4;
matlabbatch{3}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch{3}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch{3}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';
matlabbatch{4}.spm.spatial.preproc.channel.vols(1) = cfg_dep('Coregister: Estimate & Reslice: Coregistered Images', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','cfiles'));
matlabbatch{4}.spm.spatial.preproc.channel.biasreg = 0.001;
matlabbatch{4}.spm.spatial.preproc.channel.biasfwhm = 60;
matlabbatch{4}.spm.spatial.preproc.channel.write = [0 1];
matlabbatch{4}.spm.spatial.preproc.tissue(1).tpm = {'C:\toolbox\spm12\tpm\TPM.nii,1'};
matlabbatch{4}.spm.spatial.preproc.tissue(1).ngaus = 1;
matlabbatch{4}.spm.spatial.preproc.tissue(1).native = [1 0];
matlabbatch{4}.spm.spatial.preproc.tissue(1).warped = [0 0];
matlabbatch{4}.spm.spatial.preproc.tissue(2).tpm = {'C:\toolbox\spm12\tpm\TPM.nii,2'};
matlabbatch{4}.spm.spatial.preproc.tissue(2).ngaus = 1;
matlabbatch{4}.spm.spatial.preproc.tissue(2).native = [1 0];
matlabbatch{4}.spm.spatial.preproc.tissue(2).warped = [0 0];
matlabbatch{4}.spm.spatial.preproc.tissue(3).tpm = {'C:\toolbox\spm12\tpm\TPM.nii,3'};
matlabbatch{4}.spm.spatial.preproc.tissue(3).ngaus = 2;
matlabbatch{4}.spm.spatial.preproc.tissue(3).native = [1 0];
matlabbatch{4}.spm.spatial.preproc.tissue(3).warped = [0 0];
matlabbatch{4}.spm.spatial.preproc.tissue(4).tpm = {'C:\toolbox\spm12\tpm\TPM.nii,4'};
matlabbatch{4}.spm.spatial.preproc.tissue(4).ngaus = 3;
matlabbatch{4}.spm.spatial.preproc.tissue(4).native = [1 0];
matlabbatch{4}.spm.spatial.preproc.tissue(4).warped = [0 0];
matlabbatch{4}.spm.spatial.preproc.tissue(5).tpm = {'C:\toolbox\spm12\tpm\TPM.nii,5'};
matlabbatch{4}.spm.spatial.preproc.tissue(5).ngaus = 4;
matlabbatch{4}.spm.spatial.preproc.tissue(5).native = [1 0];
matlabbatch{4}.spm.spatial.preproc.tissue(5).warped = [0 0];
matlabbatch{4}.spm.spatial.preproc.tissue(6).tpm = {'C:\toolbox\spm12\tpm\TPM.nii,6'};
matlabbatch{4}.spm.spatial.preproc.tissue(6).ngaus = 2;
matlabbatch{4}.spm.spatial.preproc.tissue(6).native = [0 0];
matlabbatch{4}.spm.spatial.preproc.tissue(6).warped = [0 0];
matlabbatch{4}.spm.spatial.preproc.warp.mrf = 1;
matlabbatch{4}.spm.spatial.preproc.warp.cleanup = 1;
matlabbatch{4}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
matlabbatch{4}.spm.spatial.preproc.warp.affreg = 'mni';
matlabbatch{4}.spm.spatial.preproc.warp.fwhm = 0;
matlabbatch{4}.spm.spatial.preproc.warp.samp = 3;
matlabbatch{4}.spm.spatial.preproc.warp.write = [0 1];
matlabbatch{4}.spm.spatial.preproc.warp.vox = NaN;
matlabbatch{4}.spm.spatial.preproc.warp.bb = [NaN NaN NaN
                                              NaN NaN NaN];
matlabbatch{5}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('Segment: Forward Deformations', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','fordef', '()',{':'}));
matlabbatch{5}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 1)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','rfiles'));
matlabbatch{5}.spm.spatial.normalise.write.subj.resample(2) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 2)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{2}, '.','rfiles'));
matlabbatch{5}.spm.spatial.normalise.write.subj.resample(3) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 3)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{3}, '.','rfiles'));
matlabbatch{5}.spm.spatial.normalise.write.subj.resample(4) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 4)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{4}, '.','rfiles'));
matlabbatch{5}.spm.spatial.normalise.write.subj.resample(5) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 5)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{5}, '.','rfiles'));
matlabbatch{5}.spm.spatial.normalise.write.subj.resample(6) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 6)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{6}, '.','rfiles'));
matlabbatch{5}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
matlabbatch{5}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
matlabbatch{5}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{5}.spm.spatial.normalise.write.woptions.prefix = 'w';
matlabbatch{6}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('Segment: Forward Deformations', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','fordef', '()',{':'}));
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep('Segment: Bias Corrected (1)', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','channel', '()',{1}, '.','biascorr', '()',{':'}));
matlabbatch{6}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
matlabbatch{6}.spm.spatial.normalise.write.woptions.vox = [1 1 1];
matlabbatch{6}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{6}.spm.spatial.normalise.write.woptions.prefix = 'w';
%matlabbatch{7}.spm.spatial.smooth.data(1) = cfg_dep('Normalise: Write: Normalised Images (Subj 1)', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
%matlabbatch{7}.spm.spatial.smooth.fwhm = [6 6 6];
%matlabbatch{7}.spm.spatial.smooth.dtype = 0;
%matlabbatch{7}.spm.spatial.smooth.im = 0;
%matlabbatch{7}.spm.spatial.smooth.prefix = 's';
matlabbatch{7}.cfg_basicio.file_dir.file_ops.cfg_file_split.name = 'run1_to_run6FileSplit';
matlabbatch{7}.cfg_basicio.file_dir.file_ops.cfg_file_split.files(1) = cfg_dep('Normalise: Write: Normalised Images (Subj 1)', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{7}.cfg_basicio.file_dir.file_ops.cfg_file_split.index = {
                                                                     1
                                                                     2
                                                                     3
                                                                     4
                                                                     5
                                                                     6
                                                                     }';
matlabbatch{8}.spm.stats.fmri_spec.dir = {['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\1stLevel_unsmoothed']};
matlabbatch{8}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{8}.spm.stats.fmri_spec.timing.RT = 1.3;
matlabbatch{8}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{8}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{8}.spm.stats.fmri_spec.sess(1).scans(1) = cfg_dep('File Set Split: run1_to_run6FileSplit (1)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{1}));
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(1).name = 'AeVe';
data_run1_cond1 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run1_cond1.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(1).onset = data_run1_cond1(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(1).duration = data_run1_cond1(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(1).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(1).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(2).name = 'AeVh';
data_run1_cond2 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run1_cond2.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(2).onset = data_run1_cond2(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(2).duration = data_run1_cond2(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(2).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(2).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(3).name = 'AhVe';
data_run1_cond3 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run1_cond3.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(3).onset = data_run1_cond3(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(3).duration = data_run1_cond3(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(3).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(3).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(4).name = 'AhVh';
data_run1_cond4 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run1_cond4.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(4).onset = data_run1_cond4(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(4).duration = data_run1_cond4(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(4).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond(4).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(1).multi = {''};
matlabbatch{8}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(1).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 1)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','rpfile'));
matlabbatch{8}.spm.stats.fmri_spec.sess(1).hpf = 128;
matlabbatch{8}.spm.stats.fmri_spec.sess(2).scans(1) = cfg_dep('File Set Split: run1_to_run6FileSplit (2)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{2}));
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(1).name = 'AeVe';
data_run2_cond1 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run2_cond1.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(1).onset = data_run2_cond1(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(1).duration = data_run2_cond1(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(1).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(1).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(2).name = 'AeVh';
data_run2_cond2 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run2_cond2.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(2).onset = data_run2_cond2(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(2).duration = data_run2_cond2(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(2).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(2).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(3).name = 'AhVe';
data_run2_cond3 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run2_cond3.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(3).onset = data_run2_cond3(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(3).duration = data_run2_cond3(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(3).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(3).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(4).name = 'AhVh';
data_run2_cond4 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run2_cond4.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(4).onset = data_run2_cond4(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(4).duration = data_run2_cond4(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(4).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond(4).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(2).multi = {''};
matlabbatch{8}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(2).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 2)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{2}, '.','rpfile'));
matlabbatch{8}.spm.stats.fmri_spec.sess(2).hpf = 128;
matlabbatch{8}.spm.stats.fmri_spec.sess(3).scans(1) = cfg_dep('File Set Split: run1_to_run6FileSplit (3)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{3}));
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(1).name = 'AeVe';
data_run3_cond1 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run3_cond1.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(1).onset = data_run3_cond1(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(1).duration = data_run3_cond1(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(1).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(1).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(2).name = 'AeVh';
data_run3_cond2 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run3_cond2.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(2).onset = data_run3_cond2(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(2).duration = data_run3_cond2(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(2).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(2).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(3).name = 'AhVe';
data_run3_cond3 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run3_cond3.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(3).onset = data_run3_cond3(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(3).duration = data_run3_cond3(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(3).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(3).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(4).name = 'AhVh';
data_run3_cond4 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run3_cond4.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(4).onset = data_run3_cond4(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(4).duration = data_run3_cond4(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(4).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond(4).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(3).multi = {''};
matlabbatch{8}.spm.stats.fmri_spec.sess(3).regress = struct('name', {}, 'val', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(3).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 3)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{3}, '.','rpfile'));
matlabbatch{8}.spm.stats.fmri_spec.sess(3).hpf = 128;
matlabbatch{8}.spm.stats.fmri_spec.sess(4).scans(1) = cfg_dep('File Set Split: run1_to_run6FileSplit (4)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{4}));
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(1).name = 'AeVe';
data_run4_cond1 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run4_cond1.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(1).onset = data_run4_cond1(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(1).duration = data_run4_cond1(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(1).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(1).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(2).name = 'AeVh';
data_run4_cond2 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run4_cond2.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(2).onset = data_run4_cond2(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(2).duration = data_run4_cond1(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(2).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(2).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(3).name = 'AhVe';
data_run4_cond3 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run4_cond3.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(3).onset = data_run4_cond3(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(3).duration = data_run4_cond3(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(3).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(3).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(4).name = 'AhVh';
data_run4_cond4 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run4_cond4.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(4).onset = data_run4_cond4(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(4).duration = data_run4_cond4(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(4).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond(4).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(4).multi = {''};
matlabbatch{8}.spm.stats.fmri_spec.sess(4).regress = struct('name', {}, 'val', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(4).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 4)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{4}, '.','rpfile'));
matlabbatch{8}.spm.stats.fmri_spec.sess(4).hpf = 128;
matlabbatch{8}.spm.stats.fmri_spec.sess(5).scans(1) = cfg_dep('File Set Split: run1_to_run6FileSplit (5)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{5}));
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(1).name = 'AeVe';
data_run5_cond1 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run5_cond1.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(1).onset = data_run5_cond1(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(1).duration = data_run5_cond1(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(1).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(1).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(2).name = 'AeVh';
data_run5_cond2 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run5_cond2.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(2).onset = data_run5_cond2(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(2).duration = data_run5_cond2(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(2).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(2).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(3).name = 'AhVe';
data_run5_cond3 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run5_cond3.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(3).onset = data_run5_cond3(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(3).duration = data_run5_cond3(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(3).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(3).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(4).name = 'AhVh';
data_run5_cond4 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run5_cond4.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(4).onset = data_run5_cond4(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(4).duration = data_run5_cond4(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(4).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(5).cond(4).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(5).multi = {''};
matlabbatch{8}.spm.stats.fmri_spec.sess(5).regress = struct('name', {}, 'val', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(5).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 5)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{5}, '.','rpfile'));
matlabbatch{8}.spm.stats.fmri_spec.sess(5).hpf = 128;
matlabbatch{8}.spm.stats.fmri_spec.sess(6).scans(1) = cfg_dep('File Set Split: run1_to_run6FileSplit (6)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{6}));
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(1).name = 'AeVe';
data_run6_cond1 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run6_cond1.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(1).onset = data_run6_cond1(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(1).duration = data_run6_cond1(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(1).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(1).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(2).name = 'AeVh';
data_run6_cond2 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run6_cond2.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(2).onset = data_run6_cond2(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(2).duration = data_run6_cond2(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(2).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(2).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(3).name = 'AhVe';
data_run6_cond3 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run6_cond3.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(3).onset = data_run6_cond3(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(3).duration = data_run6_cond3(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(3).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(3).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(4).name = 'AhVh';
data_run6_cond4 = load(['G:\Backup\fMRI_dualtask\1_processed\batch_processing_spmeditor\Data\sub-' subject '\func\timing\run6_cond4.txt']);
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(4).onset = data_run6_cond4(:,1);
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(4).duration = data_run6_cond4(:,2);
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(4).tmod = 0;
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(6).cond(4).orth = 1;
matlabbatch{8}.spm.stats.fmri_spec.sess(6).multi = {''};
matlabbatch{8}.spm.stats.fmri_spec.sess(6).regress = struct('name', {}, 'val', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(6).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 6)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{6}, '.','rpfile'));
matlabbatch{8}.spm.stats.fmri_spec.sess(6).hpf = 128;
matlabbatch{8}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{8}.spm.stats.fmri_spec.bases.hrf.derivs = [1 0];
matlabbatch{8}.spm.stats.fmri_spec.volt = 1;
matlabbatch{8}.spm.stats.fmri_spec.global = 'None';
matlabbatch{8}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{8}.spm.stats.fmri_spec.mask = {''};
matlabbatch{8}.spm.stats.fmri_spec.cvi = 'AR(1)';
matlabbatch{9}.spm.stats.fmri_est.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{9}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{9}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{10}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{9}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{10}.spm.stats.con.consess{1}.tcon.name = 'aeve > rest';
matlabbatch{10}.spm.stats.con.consess{1}.tcon.weights = [1 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{10}.spm.stats.con.consess{1}.tcon.sessrep = 'replsc';
matlabbatch{10}.spm.stats.con.consess{2}.tcon.name = 'aevh > rest';
matlabbatch{10}.spm.stats.con.consess{2}.tcon.weights = [0 0 1 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{10}.spm.stats.con.consess{2}.tcon.sessrep = 'replsc';
matlabbatch{10}.spm.stats.con.consess{3}.tcon.name = 'ahve > rest';
matlabbatch{10}.spm.stats.con.consess{3}.tcon.weights = [0 0 0 0 1 0 0 0 0 0 0 0 0 0];
matlabbatch{10}.spm.stats.con.consess{3}.tcon.sessrep = 'replsc';
matlabbatch{10}.spm.stats.con.consess{4}.tcon.name = 'ahvh > rest';
matlabbatch{10}.spm.stats.con.consess{4}.tcon.weights = [0 0 0 0 0 0 1 0 0 0 0 0 0 0];
matlabbatch{10}.spm.stats.con.consess{4}.tcon.sessrep = 'replsc';
matlabbatch{10}.spm.stats.con.consess{5}.tcon.name = 'task > rest';
matlabbatch{10}.spm.stats.con.consess{5}.tcon.weights = [1 0 1 0 1 0 1 0 0 0 0 0 0 0];
matlabbatch{10}.spm.stats.con.consess{5}.tcon.sessrep = 'replsc';
matlabbatch{10}.spm.stats.con.consess{6}.tcon.name = 'sp hard > sp easy';
matlabbatch{10}.spm.stats.con.consess{6}.tcon.weights = [-1 0 -1 0 1 0 1 0 0 0 0 0 0 0];
matlabbatch{10}.spm.stats.con.consess{6}.tcon.sessrep = 'replsc';
matlabbatch{10}.spm.stats.con.consess{7}.tcon.name = 'sp easy > sp hard';
matlabbatch{10}.spm.stats.con.consess{7}.tcon.weights = [1 0 1 0 -1 0 -1 0 0 0 0 0 0 0];
matlabbatch{10}.spm.stats.con.consess{7}.tcon.sessrep = 'replsc';
matlabbatch{10}.spm.stats.con.consess{8}.tcon.name = 'vis hard > vis easy';
matlabbatch{10}.spm.stats.con.consess{8}.tcon.weights = [-1 0 1 0 -1 0 1 0 0 0 0 0 0 0];
matlabbatch{10}.spm.stats.con.consess{8}.tcon.sessrep = 'replsc';
matlabbatch{10}.spm.stats.con.consess{9}.tcon.name = 'vis easy > vis hard';
matlabbatch{10}.spm.stats.con.consess{9}.tcon.weights = [1 0 -1 0 1 0 -1 0 0 0 0 0 0 0];
matlabbatch{10}.spm.stats.con.consess{9}.tcon.sessrep = 'replsc';
matlabbatch{10}.spm.stats.con.consess{10}.tcon.name = 'interaction 1';
matlabbatch{10}.spm.stats.con.consess{10}.tcon.weights = [-1 0 1 0 1 0 -1 0 0 0 0 0 0 0];
matlabbatch{10}.spm.stats.con.consess{10}.tcon.sessrep = 'replsc';
matlabbatch{10}.spm.stats.con.delete = 0;

spm_jobman('run', matlabbatch);

end
