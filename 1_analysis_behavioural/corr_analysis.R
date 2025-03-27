library(data.table)
library(dplyr)
library(corrplot)
library(Hmisc)
library(ggpmisc)


# Correlation analysis

dat_corr<-read.csv("df_behavioural_ques_wide_subj25_2311_selected_v2.csv")
df<-dat_corr[1:25,-c(1:2)]

## Fig. C2:
c_df <- rcorr(as.matrix(df), type='pearson')
corrplot(corr=c_df$r, p.mat=c_df$P, sig.level=0.05, 
         method='color', diag=FALSE, addCoef.col=1, type='upper', insig='blank',
         number.cex=.6,
         tl.cex = .8,
         tl.col = 'black')




# Regression analysis on some of the correlations:
## brain activity predicting attention ratings: Fig. 8A

library(ggpubr)

linsula_attnsp<-ggplot(data = df, aes(x = LInsula_Mean, y = Attn_Sp)) +
  stat_poly_line() +
  stat_poly_eq(use_label(c("eq", "adj.R2", "p"))) +
  geom_point() +
  labs(x="left insula (mean)", y = "attention to speech") +
  theme_bw()

linsula_attnsp_formatted<-linsula_attnsp+theme(axis.title.x = element_text(size=14,angle = 0, hjust = 0.5),
                                               axis.title.y = element_text(size=14,angle = 90, hjust = 0.5),
                                               axis.text.x = element_text(size=12,angle = 0, hjust = 0.5),
                                               axis.text.y = element_text(size=12,angle = 0, hjust = 0.5),
                                               panel.grid.major.x = element_line(color = "grey90"),
                                               panel.grid.minor.x = element_line(color = "grey90"))



lpacg_attnvis<-ggplot(data = df, aes(x = LPaCG_Mean, y = Attn_Vis)) +
  stat_poly_line() +
  stat_poly_eq(use_label(c("eq", "adj.R2", "p"))) +
  geom_point() +
  labs(x="left PaCG (mean)", y = "attention to visual stimuli") +
  theme_bw()

lpacg_attnvis_formatted<-lpacg_attnvis+theme(axis.title.x = element_text(size=14,angle = 0, hjust = 0.5),
                                             axis.title.y = element_text(size=14,angle = 90, hjust = 0.5),
                                             axis.text.x = element_text(size=12,angle = 0, hjust = 0.5),
                                             axis.text.y = element_text(size=12,angle = 0, hjust = 0.5),
                                             panel.grid.major.x = element_line(color = "grey90"),
                                             panel.grid.minor.x = element_line(color = "grey90"))

linsula_attnvis<-ggplot(data = df, aes(x = LInsula_Mean, y = Attn_Vis)) +
  stat_poly_line() +
  stat_poly_eq(use_label(c("eq", "adj.R2", "p"))) +
  geom_point() +
  labs(x="left insula (mean)", y = "attention to visual stimuli") +
  theme_bw()

linsula_attnvis_formatted<-linsula_attnvis+theme(axis.title.x = element_text(size=14,angle = 0, hjust = 0.5),
                                                 axis.title.y = element_text(size=14,angle = 90, hjust = 0.5),
                                                 axis.text.x = element_text(size=12,angle = 0, hjust = 0.5),
                                                 axis.text.y = element_text(size=12,angle = 0, hjust = 0.5),
                                                 panel.grid.major.x = element_line(color = "grey90"),
                                                 panel.grid.minor.x = element_line(color = "grey90"))

rsfg_attnvis<-ggplot(data = df, aes(x = RSFG_Mean, y = Attn_Vis)) +
  stat_poly_line() +
  stat_poly_eq(use_label(c("eq", "adj.R2", "p"))) +
  geom_point() +
  labs(x="right SFG (mean)", y = "attention to visual stimuli") +
  theme_bw()


rsfg_attnvis_formatted <-rsfg_attnvis+theme(axis.title.x = element_text(size=14,angle = 0, hjust = 0.5),
                                            axis.title.y = element_text(size=14,angle = 90, hjust = 0.5),
                                            axis.text.x = element_text(size=12,angle = 0, hjust = 0.5),
                                            axis.text.y = element_text(size=12,angle = 0, hjust = 0.5),
                                            panel.grid.major.x = element_line(color = "grey90"),
                                            panel.grid.minor.x = element_line(color = "grey90"))


brain_vs_ratings<-ggarrange(linsula_attnsp_formatted,lpacg_attnvis_formatted,linsula_attnvis_formatted,rsfg_attnvis_formatted,
                            labels = c("(1)", "(2)","(3)","(4)"),
                            hjust=-0.2,
                            font.label = list(size = 14, face = "bold", color ="black"),ncol = 2, nrow = 2)

annotate_figure(brain_vs_ratings,
                bottom = text_grob("Beta estimate",
                                   hjust = 0.5, size = 15),
                left = text_grob("Participant rating", rot = 90,size = 15)
)



### brain activity predicting behavioural performance: Fig. 8B.


rsfgdiff_accspdiff<-ggplot(data = df, aes(x = RSFG_Diff, y = AccSp_Diff)) +
  stat_poly_line() +
  stat_poly_eq(use_label(c("eq", "adj.R2", "p"))) +
  geom_point() +
  labs(x="right SFG (Speech Hard - Speech Easy)", y = "Accuracy (Speech Hard - Speech Easy)") +
  theme_bw()

rsfgdiff_accspdiff_formatted<-rsfgdiff_accspdiff+theme(axis.title.x = element_text(size=14,angle = 0, hjust = 0.5),
                                                       axis.title.y = element_text(size=14,angle = 90, hjust = 0.5),
                                                       axis.text.x = element_text(size=12,angle = 0, hjust = 0.5),
                                                       axis.text.y = element_text(size=12,angle = 0, hjust = 0.5),
                                                       panel.grid.major.x = element_line(color = "grey90"),
                                                       panel.grid.minor.x = element_line(color = "grey90"))


rpacgmean_accspmean<-ggplot(data = df, aes(x = RPaCG_Mean, y = AccSp_Mean)) +
  stat_poly_line() +
  stat_poly_eq(use_label(c("eq", "adj.R2", "p"))) +
  geom_point() +
  labs(x="right PaCG (mean)", y = "Accuracy (mean)") +
  theme_bw()

rpacgmean_accspmean_formatted<-rpacgmean_accspmean+theme(axis.title.x = element_text(size=14,angle = 0, hjust = 0.5),
                                                         axis.title.y = element_text(size=14,angle = 90, hjust = 0.5),
                                                         axis.text.x = element_text(size=12,angle = 0, hjust = 0.5),
                                                         axis.text.y = element_text(size=12,angle = 0, hjust = 0.5),
                                                         panel.grid.major.x = element_line(color = "grey90"),
                                                         panel.grid.minor.x = element_line(color = "grey90"))


brain_vs_behav<-ggarrange(rsfgdiff_accspdiff_formatted,rpacgmean_accspmean_formatted,
                          labels = c("(1)", "(2)"),
                          hjust=-0.2,
                          font.label = list(size = 14, face = "bold", color ="black"),ncol = 2, nrow = 1)

annotate_figure(brain_vs_behav,
                bottom = text_grob("Beta estimate",
                                   hjust = 0.5, size = 15),
                left = text_grob("Speech-task response", rot = 90,size = 15)
)





# Boxplot for betas of the 5 sp H>E regions: Fig. 7B.

df_betas_raw<-read.csv("sp_h_e_rois_betas.csv")
region_reorder<-c("r_insula","r_pacg","r_sfg","l_insula","l_pacg")
region_facetlab<-c(r_insula = "right insula", r_pacg = "right PaCG",r_sfg = 'right SFG', l_insula = 'left insula', l_pacg = "left PaCG") # Set the label for panels in the plot


df_betas_raw_reorder<-df_betas_raw %>% 
  mutate(roi = fct_relevel(roi, region_reorder))

plot_fmri_n25_main_betas<-ggplot(df_betas_raw_reorder, aes(x=DiffSpeech, y=beta,fill=DiffGabor)) +
  geom_boxplot(outlier.shape=NA)+
  stat_summary(aes(group=DiffGabor,fill = DiffGabor),fun = "mean", geom = "point", shape = 23, size = 3, fill = "grey",position = position_dodge(0.75)) +
  geom_point(aes(fill=DiffGabor),size=2,shape=21, position = position_jitterdodge(jitter.width = 0.25),alpha = 0.5)+
  scale_x_discrete(breaks=c("easy","hard"),labels = c("easy","hard"))+
  scale_y_continuous(breaks = seq(-1, 1.8, by = 0.5))+
  scale_fill_manual(name = "Visual Task",values = c("light blue","light pink"))+
  coord_cartesian(ylim = c(-1, 1.8))+
  labs(x="Speech Task", y = "Beta estimate")+
  facet_wrap(~roi,labeller = labeller(roi = region_facetlab),scale = "free")+
  theme_minimal()


plot_fmri_n25_main_betas+
  theme(plot.title = element_text(size = 13,hjust=0.5),
        axis.title.x = element_text(size=12),
        axis.title.y = element_text(size=12),
        strip.text.x = element_text(size = 11),
        legend.title = element_text(size=12),
        legend.text = element_text(size=11))