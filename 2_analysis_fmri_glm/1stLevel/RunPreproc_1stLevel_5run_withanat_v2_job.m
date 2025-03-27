%-----------------------------------------------------------------------
% Job saved on 21-Jun-2023 14:32:07 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'run1run5files';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {
                                                                     {'E:\Backup\230518_study3_fMRI\data-brain-glm-dividedattn-wangetal\reanalysis_BUCNI_23subj\0_raw_nifti_nodummies_originaligned\sub-12\func\sub-12_dual-task_run-1_bold.nii'}
                                                                     {'E:\Backup\230518_study3_fMRI\data-brain-glm-dividedattn-wangetal\reanalysis_BUCNI_23subj\0_raw_nifti_nodummies_originaligned\sub-12\func\sub-12_dual-task_run-2_bold.nii'}
                                                                     {'E:\Backup\230518_study3_fMRI\data-brain-glm-dividedattn-wangetal\reanalysis_BUCNI_23subj\0_raw_nifti_nodummies_originaligned\sub-12\func\sub-12_dual-task_run-3_bold.nii'}
                                                                     {'E:\Backup\230518_study3_fMRI\data-brain-glm-dividedattn-wangetal\reanalysis_BUCNI_23subj\0_raw_nifti_nodummies_originaligned\sub-12\func\sub-12_dual-task_run-4_bold.nii'}
                                                                     {'E:\Backup\230518_study3_fMRI\data-brain-glm-dividedattn-wangetal\reanalysis_BUCNI_23subj\0_raw_nifti_nodummies_originaligned\sub-12\func\sub-12_dual-task_run-5_bold.nii'}
                                                                     }';
matlabbatch{2}.spm.spatial.realign.estwrite.data{1}(1) = cfg_dep('Named File Selector: run1run5files(1) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{2}.spm.spatial.realign.estwrite.data{2}(1) = cfg_dep('Named File Selector: run1run5files(2) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{2}));
matlabbatch{2}.spm.spatial.realign.estwrite.data{3}(1) = cfg_dep('Named File Selector: run1run5files(3) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{3}));
matlabbatch{2}.spm.spatial.realign.estwrite.data{4}(1) = cfg_dep('Named File Selector: run1run5files(4) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{4}));
matlabbatch{2}.spm.spatial.realign.estwrite.data{5}(1) = cfg_dep('Named File Selector: run1run5files(5) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{5}));
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
matlabbatch{3}.spm.spatial.coreg.estwrite.source = {'E:\Backup\230518_study3_fMRI\data-brain-glm-dividedattn-wangetal\reanalysis_BUCNI_23subj\0_raw_nifti_nodummies_originaligned\sub-12\anat\sub-12_dual-task_anat_raw.nii,1'};
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
matlabbatch{5}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep('Segment: Bias Corrected (1)', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','channel', '()',{1}, '.','biascorr', '()',{':'}));
matlabbatch{5}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
matlabbatch{5}.spm.spatial.normalise.write.woptions.vox = [1 1 1];
matlabbatch{5}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{5}.spm.spatial.normalise.write.woptions.prefix = 'w';
matlabbatch{6}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('Segment: Forward Deformations', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','fordef', '()',{':'}));
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 1)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','rfiles'));
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(2) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 2)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{2}, '.','rfiles'));
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(3) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 3)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{3}, '.','rfiles'));
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(4) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 4)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{4}, '.','rfiles'));
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(5) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 5)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{5}, '.','rfiles'));
matlabbatch{6}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
matlabbatch{6}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
matlabbatch{6}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{6}.spm.spatial.normalise.write.woptions.prefix = 'w';
matlabbatch{7}.spm.spatial.smooth.data(1) = cfg_dep('Normalise: Write: Normalised Images (Subj 1)', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{7}.spm.spatial.smooth.fwhm = [6 6 6];
matlabbatch{7}.spm.spatial.smooth.dtype = 0;
matlabbatch{7}.spm.spatial.smooth.im = 0;
matlabbatch{7}.spm.spatial.smooth.prefix = 's';
matlabbatch{8}.cfg_basicio.file_dir.file_ops.cfg_file_split.name = 'run1run5FileSplit';
matlabbatch{8}.cfg_basicio.file_dir.file_ops.cfg_file_split.files(1) = cfg_dep('Smooth: Smoothed Images', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{8}.cfg_basicio.file_dir.file_ops.cfg_file_split.index = {
                                                                     1
                                                                     2
                                                                     3
                                                                     4
                                                                     5
                                                                     }';
matlabbatch{9}.spm.stats.fmri_spec.dir = {'E:\Backup\230518_study3_fMRI\data-brain-glm-dividedattn-wangetal\reanalysis_BUCNI_23subj\0_raw_nifti_nodummies_originaligned\sub-12\1stLevel'};
matlabbatch{9}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{9}.spm.stats.fmri_spec.timing.RT = 1.3;
matlabbatch{9}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{9}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).scans(1) = cfg_dep('File Set Split: run1run5FileSplit (1)', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{1}));
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(1).name = 'aeve';
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(1).onset = [132.69
                                                            219.052];
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(1).duration = [31.309
                                                               31.319];
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(1).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(1).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(2).name = 'aevh';
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(2).onset = [88.409
                                                            304.568];
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(2).duration = [31.321
                                                               31.31];
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(2).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(2).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(3).name = 'ahve';
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(3).onset = [43.904
                                                            176.403];
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(3).duration = [31.33
                                                               31.316];
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(3).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(3).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(4).name = 'ahvh';
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(4).onset = [0
                                                            263.152];
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(4).duration = [31.322
                                                               31.323];
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(4).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(1).cond(4).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(1).multi = {''};
matlabbatch{9}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(1).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 1)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','rpfile'));
matlabbatch{9}.spm.stats.fmri_spec.sess(1).hpf = 128;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).scans(1) = cfg_dep('File Set Split: run1run5FileSplit (2)', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{2}));
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(1).name = 'aeve';
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(1).onset = [42.76
                                                            298.011];
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(1).duration = [31.31
                                                               31.323];
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(1).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(1).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(2).name = 'aevh';
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(2).onset = [130.715
                                                            214.154];
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(2).duration = [31.312
                                                               31.308];
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(2).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(2).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(3).name = 'ahve';
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(3).onset = [0
                                                            172.208];
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(3).duration = [31.318
                                                               31.32];
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(3).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(3).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(4).name = 'ahvh';
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(4).onset = [86.938
                                                            255.744];
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(4).duration = [31.321
                                                               31.32];
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(4).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(2).cond(4).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(2).multi = {''};
matlabbatch{9}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(2).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 2)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{2}, '.','rpfile'));
matlabbatch{9}.spm.stats.fmri_spec.sess(2).hpf = 128;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).scans(1) = cfg_dep('File Set Split: run1run5FileSplit (3)', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{3}));
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(1).name = 'aeve';
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(1).onset = [216.304
                                                            300.572];
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(1).duration = [31.312
                                                               31.316];
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(1).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(1).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(2).name = 'aevh';
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(2).onset = [0.004
                                                            87.355];
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(2).duration = [31.334
                                                               31.322];
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(2).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(2).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(3).name = 'ahve';
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(3).onset = [174.6
                                                            258.907];
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(3).duration = [31.321
                                                               31.312];
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(3).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(3).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(4).name = 'ahvh';
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(4).onset = [42.102
                                                            131.847];
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(4).duration = [31.32
                                                               31.317];
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(4).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(3).cond(4).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(3).multi = {''};
matlabbatch{9}.spm.stats.fmri_spec.sess(3).regress = struct('name', {}, 'val', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(3).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 3)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{3}, '.','rpfile'));
matlabbatch{9}.spm.stats.fmri_spec.sess(3).hpf = 128;
matlabbatch{9}.spm.stats.fmri_spec.sess(4).scans(1) = cfg_dep('File Set Split: run1run5FileSplit (4)', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{4}));
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(1).name = 'aeve';
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(1).onset = [86.202
                                                            298.495];
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(1).duration = [31.314
                                                               31.315];
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(1).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(1).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(2).name = 'aevh';
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(2).onset = [0.003
                                                            170.39];
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(2).duration = [31.325
                                                               31.312];
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(2).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(2).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(3).name = 'ahve';
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(3).onset = [128.825
                                                            257.064];
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(3).duration = [31.31
                                                               31.311];
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(3).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(3).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(4).name = 'ahvh';
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(4).onset = [44.515
                                                            212.916];
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(4).duration = [31.316
                                                               31.322];
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(4).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(4).cond(4).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(4).multi = {''};
matlabbatch{9}.spm.stats.fmri_spec.sess(4).regress = struct('name', {}, 'val', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(4).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 4)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{4}, '.','rpfile'));
matlabbatch{9}.spm.stats.fmri_spec.sess(4).hpf = 128;
matlabbatch{9}.spm.stats.fmri_spec.sess(5).scans(1) = cfg_dep('File Set Split: run1run5FileSplit (5)', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{5}));
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(1).name = 'aeve';
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(1).onset = [86.408
                                                            175.566];
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(1).duration = [31.32
                                                               31.321];
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(1).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(1).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(2).name = 'aevh';
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(2).onset = [42.486
                                                            262.6];
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(2).duration = [31.322
                                                               31.309];
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(2).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(2).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(3).name = 'ahve';
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(3).onset = [0
                                                            306.459];
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(3).duration = [31.324
                                                               31.321];
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(3).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(3).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(4).name = 'ahvh';
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(4).onset = [130.282
                                                            217.714];
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(4).duration = [31.317
                                                               31.307];
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(4).tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(5).cond(4).orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess(5).multi = {''};
matlabbatch{9}.spm.stats.fmri_spec.sess(5).regress = struct('name', {}, 'val', {});
matlabbatch{9}.spm.stats.fmri_spec.sess(5).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 5)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{5}, '.','rpfile'));
matlabbatch{9}.spm.stats.fmri_spec.sess(5).hpf = 128;
matlabbatch{9}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{9}.spm.stats.fmri_spec.bases.hrf.derivs = [1 0];
matlabbatch{9}.spm.stats.fmri_spec.volt = 1;
matlabbatch{9}.spm.stats.fmri_spec.global = 'None';
matlabbatch{9}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{9}.spm.stats.fmri_spec.mask = {''};
matlabbatch{9}.spm.stats.fmri_spec.cvi = 'AR(1)';
matlabbatch{10}.spm.stats.fmri_est.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{9}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{10}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{10}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{11}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{10}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{11}.spm.stats.con.consess{1}.tcon.name = 'aeve_rest';
matlabbatch{11}.spm.stats.con.consess{1}.tcon.weights = [1 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{11}.spm.stats.con.consess{1}.tcon.sessrep = 'replsc';
matlabbatch{11}.spm.stats.con.consess{2}.tcon.name = 'aevh_rest';
matlabbatch{11}.spm.stats.con.consess{2}.tcon.weights = [0 0 1 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{11}.spm.stats.con.consess{2}.tcon.sessrep = 'replsc';
matlabbatch{11}.spm.stats.con.consess{3}.tcon.name = 'ahve_rest';
matlabbatch{11}.spm.stats.con.consess{3}.tcon.weights = [0 0 0 0 1 0 0 0 0 0 0 0 0 0];
matlabbatch{11}.spm.stats.con.consess{3}.tcon.sessrep = 'replsc';
matlabbatch{11}.spm.stats.con.consess{4}.tcon.name = 'ahvh_rest';
matlabbatch{11}.spm.stats.con.consess{4}.tcon.weights = [0 0 0 0 0 0 1 0 0 0 0 0 0 0];
matlabbatch{11}.spm.stats.con.consess{4}.tcon.sessrep = 'replsc';
matlabbatch{11}.spm.stats.con.consess{5}.tcon.name = 'task_rest';
matlabbatch{11}.spm.stats.con.consess{5}.tcon.weights = [1 0 1 0 1 0 1 0 0 0 0 0 0 0];
matlabbatch{11}.spm.stats.con.consess{5}.tcon.sessrep = 'replsc';
matlabbatch{11}.spm.stats.con.consess{6}.tcon.name = 'ah_ae';
matlabbatch{11}.spm.stats.con.consess{6}.tcon.weights = [-1 0 -1 0 1 0 1 0 0 0 0 0 0 0];
matlabbatch{11}.spm.stats.con.consess{6}.tcon.sessrep = 'replsc';
matlabbatch{11}.spm.stats.con.consess{7}.tcon.name = 'ae_ah';
matlabbatch{11}.spm.stats.con.consess{7}.tcon.weights = [1 0 1 0 -1 0 -1 0 0 0 0 0 0 0];
matlabbatch{11}.spm.stats.con.consess{7}.tcon.sessrep = 'replsc';
matlabbatch{11}.spm.stats.con.consess{8}.tcon.name = 'vh_ve';
matlabbatch{11}.spm.stats.con.consess{8}.tcon.weights = [-1 0 1 0 -1 0 1 0 0 0 0 0 0 0];
matlabbatch{11}.spm.stats.con.consess{8}.tcon.sessrep = 'replsc';
matlabbatch{11}.spm.stats.con.consess{9}.tcon.name = 've_vh';
matlabbatch{11}.spm.stats.con.consess{9}.tcon.weights = [1 0 -1 0 1 0 -1 0 0 0 0 0 0 0];
matlabbatch{11}.spm.stats.con.consess{9}.tcon.sessrep = 'replsc';
matlabbatch{11}.spm.stats.con.consess{10}.tcon.name = 'interaction_1';
matlabbatch{11}.spm.stats.con.consess{10}.tcon.weights = [-1 0 1 0 1 0 -1 0 0 0 0 0 0 0];
matlabbatch{11}.spm.stats.con.consess{10}.tcon.sessrep = 'replsc';
matlabbatch{11}.spm.stats.con.consess{11}.tcon.name = 'interaction_2';
matlabbatch{11}.spm.stats.con.consess{11}.tcon.weights = [1 0 -1 0 -1 0 1 0 0 0 0 0 0 0];
matlabbatch{11}.spm.stats.con.consess{11}.tcon.sessrep = 'replsc';
matlabbatch{11}.spm.stats.con.delete = 0;
