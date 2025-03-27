%-----------------------------------------------------------------------
% Job saved on 22-Jun-2023 10:49:43 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'run1run5files';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {
                                                                     {'E:\Backup\230518_study3_fMRI\data-brain-glm-dividedattn-wangetal\reanalysis_BUCNI_23subj\0_raw_nifti_nodummies_originaligned\sub-06\func\sub-06_dual-task_run-1_bold.nii'}
                                                                     {'E:\Backup\230518_study3_fMRI\data-brain-glm-dividedattn-wangetal\reanalysis_BUCNI_23subj\0_raw_nifti_nodummies_originaligned\sub-06\func\sub-06_dual-task_run-2_bold.nii'}
                                                                     {'E:\Backup\230518_study3_fMRI\data-brain-glm-dividedattn-wangetal\reanalysis_BUCNI_23subj\0_raw_nifti_nodummies_originaligned\sub-06\func\sub-06_dual-task_run-3_bold.nii'}
                                                                     {'E:\Backup\230518_study3_fMRI\data-brain-glm-dividedattn-wangetal\reanalysis_BUCNI_23subj\0_raw_nifti_nodummies_originaligned\sub-06\func\sub-06_dual-task_run-4_bold.nii'}
                                                                     {'E:\Backup\230518_study3_fMRI\data-brain-glm-dividedattn-wangetal\reanalysis_BUCNI_23subj\0_raw_nifti_nodummies_originaligned\sub-06\func\sub-06_dual-task_run-5_bold.nii'}
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
matlabbatch{3}.spm.spatial.normalise.estwrite.subj.vol(1) = cfg_dep('Realign: Estimate & Reslice: Mean Image', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','rmean'));
matlabbatch{3}.spm.spatial.normalise.estwrite.subj.resample(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 1)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','rfiles'));
matlabbatch{3}.spm.spatial.normalise.estwrite.subj.resample(2) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 2)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{2}, '.','rfiles'));
matlabbatch{3}.spm.spatial.normalise.estwrite.subj.resample(3) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 3)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{3}, '.','rfiles'));
matlabbatch{3}.spm.spatial.normalise.estwrite.subj.resample(4) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 4)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{4}, '.','rfiles'));
matlabbatch{3}.spm.spatial.normalise.estwrite.subj.resample(5) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 5)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{5}, '.','rfiles'));
matlabbatch{3}.spm.spatial.normalise.estwrite.eoptions.biasreg = 0.0001;
matlabbatch{3}.spm.spatial.normalise.estwrite.eoptions.biasfwhm = 60;
matlabbatch{3}.spm.spatial.normalise.estwrite.eoptions.tpm = {'C:\toolbox\spm12\tpm\TPM.nii'};
matlabbatch{3}.spm.spatial.normalise.estwrite.eoptions.affreg = 'mni';
matlabbatch{3}.spm.spatial.normalise.estwrite.eoptions.reg = [0 0.001 0.5 0.05 0.2];
matlabbatch{3}.spm.spatial.normalise.estwrite.eoptions.fwhm = 0;
matlabbatch{3}.spm.spatial.normalise.estwrite.eoptions.samp = 3;
matlabbatch{3}.spm.spatial.normalise.estwrite.woptions.bb = [-78 -112 -70
                                                             78 76 85];
matlabbatch{3}.spm.spatial.normalise.estwrite.woptions.vox = [2 2 2];
matlabbatch{3}.spm.spatial.normalise.estwrite.woptions.interp = 4;
matlabbatch{3}.spm.spatial.normalise.estwrite.woptions.prefix = 'w';
matlabbatch{4}.spm.spatial.smooth.data(1) = cfg_dep('Normalise: Estimate & Write: Normalised Images (Subj 1)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{4}.spm.spatial.smooth.fwhm = [6 6 6];
matlabbatch{4}.spm.spatial.smooth.dtype = 0;
matlabbatch{4}.spm.spatial.smooth.im = 0;
matlabbatch{4}.spm.spatial.smooth.prefix = 's';
matlabbatch{5}.cfg_basicio.file_dir.file_ops.cfg_file_split.name = 'run1torun5FileSplit';
matlabbatch{5}.cfg_basicio.file_dir.file_ops.cfg_file_split.files(1) = cfg_dep('Smooth: Smoothed Images', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{5}.cfg_basicio.file_dir.file_ops.cfg_file_split.index = {
                                                                     1
                                                                     2
                                                                     3
                                                                     4
                                                                     5
                                                                     }';
matlabbatch{6}.spm.stats.fmri_spec.dir = {'E:\Backup\230518_study3_fMRI\data-brain-glm-dividedattn-wangetal\reanalysis_BUCNI_23subj\0_raw_nifti_nodummies_originaligned\sub-06\1stLevel'};
matlabbatch{6}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{6}.spm.stats.fmri_spec.timing.RT = 1.3;
matlabbatch{6}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{6}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{6}.spm.stats.fmri_spec.sess(1).scans(1) = cfg_dep('File Set Split: run1torun5FileSplit (1)', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{1}));
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(1).name = 'aeve';
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(1).onset = [88.196
                                                            216.979];
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(1).duration = [31.313
                                                               31.32];
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(1).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(1).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(2).name = 'aevh';
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(2).onset = [130.416
                                                            259.575];
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(2).duration = [31.311
                                                               31.309];
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(2).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(2).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(3).name = 'ahve';
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(3).onset = [0.001
                                                            302.535];
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(3).duration = [31.318
                                                               31.318];
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(3).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(3).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(4).name = 'ahvh';
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(4).onset = [43.333
                                                            174.787];
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(4).duration = [31.329
                                                               31.312];
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(4).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(1).cond(4).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(1).multi = {''};
matlabbatch{6}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(1).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 1)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','rpfile'));
matlabbatch{6}.spm.stats.fmri_spec.sess(1).hpf = 128;
matlabbatch{6}.spm.stats.fmri_spec.sess(2).scans(1) = cfg_dep('File Set Split: run1torun5FileSplit (2)', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{2}));
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(1).name = 'aeve';
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(1).onset = [45.239
                                                            310.021];
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(1).duration = [31.308
                                                               31.315];
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(1).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(1).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(2).name = 'aevh';
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(2).onset = [0
                                                            178.032];
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(2).duration = [31.309
                                                               31.309];
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(2).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(2).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(3).name = 'ahve';
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(3).onset = [132.759
                                                            265.333];
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(3).duration = [31.31
                                                               31.315];
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(3).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(3).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(4).name = 'ahvh';
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(4).onset = [88.047
                                                            222.789];
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(4).duration = [31.353
                                                               31.323];
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(4).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(2).cond(4).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(2).multi = {''};
matlabbatch{6}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(2).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 2)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{2}, '.','rpfile'));
matlabbatch{6}.spm.stats.fmri_spec.sess(2).hpf = 128;
matlabbatch{6}.spm.stats.fmri_spec.sess(3).scans(1) = cfg_dep('File Set Split: run1torun5FileSplit (3)', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{3}));
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(1).name = 'aeve';
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(1).onset = [42.013
                                                            170.512];
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(1).duration = [31.318
                                                               31.31];
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(1).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(1).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(2).name = 'aevh';
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(2).onset = [83.577
                                                            302.417];
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(2).duration = [31.323
                                                               31.316];
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(2).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(2).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(3).name = 'ahve';
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(3).onset = [0
                                                            257.353];
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(3).duration = [31.312
                                                               31.307];
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(3).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(3).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(4).name = 'ahvh';
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(4).onset = [126.514
                                                            215.407];
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(4).duration = [31.321
                                                               31.319];
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(4).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(3).cond(4).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(3).multi = {''};
matlabbatch{6}.spm.stats.fmri_spec.sess(3).regress = struct('name', {}, 'val', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(3).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 3)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{3}, '.','rpfile'));
matlabbatch{6}.spm.stats.fmri_spec.sess(3).hpf = 128;
matlabbatch{6}.spm.stats.fmri_spec.sess(4).scans(1) = cfg_dep('File Set Split: run1torun5FileSplit (4)', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{4}));
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(1).name = 'aeve';
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(1).onset = [0.001
                                                            132.707];
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(1).duration = [31.325
                                                               31.312];
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(1).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(1).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(2).name = 'aevh';
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(2).onset = [87.507
                                                            219.529];
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(2).duration = [31.309
                                                               31.313];
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(2).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(2).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(3).name = 'ahve';
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(3).onset = [42.579
                                                            303.652];
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(3).duration = [31.315
                                                               31.309];
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(3).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(3).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(4).name = 'ahvh';
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(4).onset = [175.294
                                                            261.223];
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(4).duration = [31.31
                                                               31.32];
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(4).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(4).cond(4).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(4).multi = {''};
matlabbatch{6}.spm.stats.fmri_spec.sess(4).regress = struct('name', {}, 'val', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(4).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 4)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{4}, '.','rpfile'));
matlabbatch{6}.spm.stats.fmri_spec.sess(4).hpf = 128;
matlabbatch{6}.spm.stats.fmri_spec.sess(5).scans(1) = cfg_dep('File Set Split: run1torun5FileSplit (5)', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{5}));
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(1).name = 'aeve';
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(1).onset = [0
                                                            127.867];
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(1).duration = [31.309
                                                               31.316];
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(1).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(1).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(2).name = 'aevh';
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(2).onset = [213.739
                                                            299.491];
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(2).duration = [31.316
                                                               31.318];
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(2).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(2).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(3).name = 'ahve';
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(3).onset = [41.697
                                                            255.3];
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(3).duration = [31.315
                                                               31.322];
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(3).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(3).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(4).name = 'ahvh';
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(4).onset = [84.978
                                                            170.447];
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(4).duration = [31.319
                                                               31.321];
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(4).tmod = 0;
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(5).cond(4).orth = 1;
matlabbatch{6}.spm.stats.fmri_spec.sess(5).multi = {''};
matlabbatch{6}.spm.stats.fmri_spec.sess(5).regress = struct('name', {}, 'val', {});
matlabbatch{6}.spm.stats.fmri_spec.sess(5).multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 5)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{5}, '.','rpfile'));
matlabbatch{6}.spm.stats.fmri_spec.sess(5).hpf = 128;
matlabbatch{6}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{6}.spm.stats.fmri_spec.bases.hrf.derivs = [1 0];
matlabbatch{6}.spm.stats.fmri_spec.volt = 1;
matlabbatch{6}.spm.stats.fmri_spec.global = 'None';
matlabbatch{6}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{6}.spm.stats.fmri_spec.mask = {''};
matlabbatch{6}.spm.stats.fmri_spec.cvi = 'AR(1)';
matlabbatch{7}.spm.stats.fmri_est.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{7}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{7}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{8}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{8}.spm.stats.con.consess{1}.tcon.name = 'aeve_rest';
matlabbatch{8}.spm.stats.con.consess{1}.tcon.weights = [1 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{8}.spm.stats.con.consess{1}.tcon.sessrep = 'replsc';
matlabbatch{8}.spm.stats.con.consess{2}.tcon.name = 'aevh_rest';
matlabbatch{8}.spm.stats.con.consess{2}.tcon.weights = [0 0 1 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{8}.spm.stats.con.consess{2}.tcon.sessrep = 'replsc';
matlabbatch{8}.spm.stats.con.consess{3}.tcon.name = 'ahve_rest';
matlabbatch{8}.spm.stats.con.consess{3}.tcon.weights = [0 0 0 0 1 0 0 0 0 0 0 0 0 0];
matlabbatch{8}.spm.stats.con.consess{3}.tcon.sessrep = 'replsc';
matlabbatch{8}.spm.stats.con.consess{4}.tcon.name = 'ahvh_rest';
matlabbatch{8}.spm.stats.con.consess{4}.tcon.weights = [0 0 0 0 0 0 1 0 0 0 0 0 0 0];
matlabbatch{8}.spm.stats.con.consess{4}.tcon.sessrep = 'replsc';
matlabbatch{8}.spm.stats.con.consess{5}.tcon.name = 'task_rest';
matlabbatch{8}.spm.stats.con.consess{5}.tcon.weights = [1 0 1 0 1 0 1 0 0 0 0 0 0 0];
matlabbatch{8}.spm.stats.con.consess{5}.tcon.sessrep = 'replsc';
matlabbatch{8}.spm.stats.con.consess{6}.tcon.name = 'ah_ae';
matlabbatch{8}.spm.stats.con.consess{6}.tcon.weights = [-1 0 -1 0 1 0 1 0 0 0 0 0 0 0];
matlabbatch{8}.spm.stats.con.consess{6}.tcon.sessrep = 'replsc';
matlabbatch{8}.spm.stats.con.consess{7}.tcon.name = 'ae_ah';
matlabbatch{8}.spm.stats.con.consess{7}.tcon.weights = [1 0 1 0 -1 0 -1 0 0 0 0 0 0 0];
matlabbatch{8}.spm.stats.con.consess{7}.tcon.sessrep = 'replsc';
matlabbatch{8}.spm.stats.con.consess{8}.tcon.name = 'vh_ve';
matlabbatch{8}.spm.stats.con.consess{8}.tcon.weights = [-1 0 1 0 -1 0 1 0 0 0 0 0 0 0];
matlabbatch{8}.spm.stats.con.consess{8}.tcon.sessrep = 'replsc';
matlabbatch{8}.spm.stats.con.consess{9}.tcon.name = 've_vh';
matlabbatch{8}.spm.stats.con.consess{9}.tcon.weights = [1 0 -1 0 1 0 -1 0 0 0 0 0 0 0];
matlabbatch{8}.spm.stats.con.consess{9}.tcon.sessrep = 'replsc';
matlabbatch{8}.spm.stats.con.consess{10}.tcon.name = 'interaction_1';
matlabbatch{8}.spm.stats.con.consess{10}.tcon.weights = [-1 0 1 0 1 0 -1 0 0 0 0 0 0 0];
matlabbatch{8}.spm.stats.con.consess{10}.tcon.sessrep = 'replsc';
matlabbatch{8}.spm.stats.con.consess{11}.tcon.name = 'interaction_2';
matlabbatch{8}.spm.stats.con.consess{11}.tcon.weights = [1 0 -1 0 -1 0 1 0 0 0 0 0 0 0];
matlabbatch{8}.spm.stats.con.consess{11}.tcon.sessrep = 'replsc';
matlabbatch{8}.spm.stats.con.delete = 0;
