# Copyright: Han Wang

## V1: 25/03/2025 - This script contains behavioural-task data analysis for the fMRI-ML study in Wang et al.
## Please run descriptive.R first to load the data sets into your environment.


# Load packages and define some functions

library(car)
library(dplyr)
library(tidyr)

library(ggplot2)
library(ggsci)
library(ggeffects)
#library(sjPlot)
library(forcats)
library(ggh4x)

library(lme4)
library(lmerTest)

library(quickpsy)

library(mgcv)
library(mgcViz)
library(itsadug)


# Models

## speech accuracy

### a saturated model:
m_sp_acc_full <- glmer(AccAud~1+DiffSpeech*DiffGabor+(1+DiffSpeech*DiffGabor|Participant)+(1+DiffSpeech*DiffGabor|Sentence),
                       data=fmripilot_behav_n1_main, family = binomial(link = "logit"), 
                       control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=30e5)))
summary(m_sp_acc_full)

gg_m_sp_acc_full<-ggpredict(m_sp_acc_full, terms = c("DiffSpeech","DiffGabor")) # save the prediction from the model using ggpredict()
plot(gg_m_sp_acc_full) # plot the model

### m_sp_acc_3 best model:
m_sp_acc_3_1 <- glmer(AccAud~1+DiffSpeech*DiffGabor+(1+DiffSpeech+DiffGabor|Participant)+(1+DiffSpeech|Sentence),
                      data=fmripilot_behav_n1_main, family = binomial(link = "logit"), 
                      control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=30e5)))
summary(m_sp_acc_3_1)

#### fit with the best-model structure using afex for anova table and p values.

library(afex)
library(emmeans)
m_sp_acc_3_1_afex<-(mixed(AccAud~1+DiffSpeech*DiffGabor+(1+DiffSpeech+DiffGabor|Participant)+(1+DiffSpeech|Sentence),
                          data=fmripilot_behav_n1_main, method = "LRT",family = binomial(link = "logit"), 
                          control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=30e5))))
summary(m_sp_acc_3_1_afex)
nice(m_sp_acc_3_1_afex)

(emm_m_sp_acc_3_1_afex_sp<-emmeans(m_sp_acc_3_1_afex,"DiffSpeech")) # estimation for task-wise performance using library(afex)
pairs(emm_m_sp_acc_3_1_afex_sp,adjust="holm") # pair-wise comparison results for task conditions

(emm_m_sp_acc_3_1_afex_vis<-emmeans(m_sp_acc_3_1_afex,"DiffGabor")) # estimation for task-wise performance using library(afex)
pairs(emm_m_sp_acc_3_1_afex_vis,adjust="holm") # pair-wise comparison results for task conditions




## Acc speech task TD vs response 

### a saturated model:
m_sp_td_glmm_full<- glmer(AccAud~1+absdegTDrerange*DiffSpeech*DiffGabor+(1+DiffSpeech+DiffGabor|Participant),
                          data=behavioural_n1_main_NonTarget_reranged, family = binomial(link = "logit"), 
                          control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=40e5)))

summary(m_sp_td_glmm_full)

gg_m_sp_td_glmm_full<-ggpredict(m_sp_td_glmm_full, terms = c("absdegTDrerange[all]","DiffSpeech","DiffGabor")) # save the prediction from the model using ggpredict()
plot(gg_m_sp_td_glmm_full) # plot the model

### the best model:
m_sp_td_glmm_1<- glmer(AccAud~1+absdegTDrerange*DiffSpeech*DiffGabor+(1+DiffSpeech|Participant),
                       data=behavioural_n1_main_NonTarget_reranged, family = binomial(link = "logit"), 
                       control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=40e5)))

summary(m_sp_td_glmm_1)

gg_m_sp_td_glmm_1<-ggpredict(m_sp_td_glmm_1, terms = c("absdegTDrerange[all]","DiffSpeech","DiffGabor")) # save the prediction from the model using ggpredict()
plot(gg_m_sp_td_glmm_1) # plot the model

anova(m_sp_td_glmm_1,m_sp_td_glmm_full)


gg_m_sp_td_glmm_1_orirange <- gg_m_sp_td_glmm_1 %>%
  mutate(x_orirange=case_when(facet == "hard" ~ x+6,
                              facet == "easy" ~ x+48))


facet_labels<-c(easy = "Visual Easy", hard = "Visual Hard")
plot_m_sp_td_glmm_1_gg<-ggplot(gg_m_sp_td_glmm_1_orirange, aes(x=x_orirange, y=predicted, color=group,fill = group)) +
  geom_line(aes(x=x_orirange, y=predicted, colour = group), size=.6) +
  geom_ribbon(aes(ymin=conf.low, ymax=conf.high, x=x_orirange, y=predicted, color = group,fill = group), alpha = 0.2)+
  scale_y_continuous(breaks = seq(0, 1, by = 0.1))+
  scale_color_manual(labels = c("easy","hard"),values = c("#a18df8","#f8d38d"))+
  scale_fill_manual(labels = c("easy","hard"),values = c("#a18df8","#f8d38d"))+
  labs(x="Target-Distractor Angular Discrepancy (degree)", y = "Proportion of 'understood'",color = "Speech Task",fill ="Speech Task")+
  theme_minimal()+
  facet_wrap(~ facet,labeller=labeller(facet = facet_labels),strip.position="bottom",scales = "free_x")+
  facetted_pos_scales(
    x = list(
      facet == "easy" ~ scale_x_continuous(breaks = seq(48, 60, by = 2)),
      facet == "hard" ~ scale_x_continuous(breaks = seq(6, 18, by = 2))
    )
  )


plot_m_sp_td_glmm_1_gg+
  theme(plot.title = element_text(size = 13,hjust=0.5), 
        axis.text.x = element_text(size=11,angle = 0, hjust = 0.5),
        axis.title.x = element_text(size=12),
        axis.title.y = element_text(size=12),
        legend.title = element_text(size=12),
        legend.text = element_text(size=11))


#### change the reference levels for post-hoc analysis:
m_sp_td_glmm_1_1<- glmer(AccAud~1+absdegTDrerange*DiffSpeech*relevel(as.factor(DiffGabor),ref = 'hard')+(1+DiffSpeech|Participant),
                         data=behavioural_n1_main_NonTarget_reranged, family = binomial(link = "logit"), 
                         control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=40e5)))

summary(m_sp_td_glmm_1_1)


m_sp_td_glmm_1_2<- glmer(AccAud~1+absdegTDrerange*relevel(as.factor(DiffSpeech),ref = 'hard')*relevel(as.factor(DiffGabor),ref = 'hard')+(1+DiffSpeech|Participant),
                         data=behavioural_n1_main_NonTarget_reranged, family = binomial(link = "logit"), 
                         control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=40e5)))

summary(m_sp_td_glmm_1_2)


m_sp_td_glmm_1_3<- glmer(AccAud~1+absdegTDrerange*relevel(as.factor(DiffSpeech),ref = 'hard')*DiffGabor+(1+DiffSpeech|Participant),
                         data=behavioural_n1_main_NonTarget_reranged, family = binomial(link = "logit"), 
                         control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=40e5)))
summary(m_sp_td_glmm_1_3)



## gabor accuracy

### a saturated model:
m_gb_acc_full <- glmer(AccGb~1+DiffSpeech*DiffGabor+(1+DiffSpeech*DiffGabor|Participant)+(1+DiffSpeech*DiffGabor|Sentence),
                       data=fmripilot_behav_n1_main, family = binomial(link = "logit"), 
                       control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=30e5)))
summary(m_gb_acc_full)

gg_m_gb_acc_full<-ggpredict(m_gb_acc_full, terms = c("DiffGabor","DiffSpeech")) # save the prediction from the model using ggpredict()
plot(gg_m_gb_acc_full) # plot the model


### m6 is the best model:
m_gb_acc_6 <- glmer(AccGb~1+DiffSpeech*DiffGabor+(1+DiffGabor|Participant),
                    data=fmripilot_behav_n1_main, family = binomial(link = "logit"), 
                    control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=30e5)))
summary(m_gb_acc_6)


#### refitting with afex

library(afex)
library(emmeans)
m_gb_acc_6_afex<-(mixed(AccGb~1+DiffSpeech*DiffGabor+(1+DiffGabor|Participant),
                        data=fmripilot_behav_n1_main, method = "LRT", family = binomial(link = "logit"), 
                        control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=30e5))))
summary(m_gb_acc_6_afex)

anova(m_gb_acc_6_afex)

(emm_m_gb_acc_6_afex_vis<-emmeans(m_gb_acc_6_afex,"DiffSpeech","DiffGabor")) # estimation for task-wise performance using library(afex)
pairs(emm_m_gb_acc_6_afex_vis,adjust="holm") # pair-wise comparison results for task conditions

(emm_m_gb_acc_6_afex_sp<-emmeans(m_gb_acc_6_afex,"DiffGabor","DiffSpeech")) # estimation for task-wise performance using library(afex)
pairs(emm_m_gb_acc_6_afex_sp,adjust="holm") # pair-wise comparison results for task conditions

detach("package:afex", unload=TRUE)


## gabor TD vs correct_rej

### a saturated model:
m_gb_td_glmm_full<- glmer(AccGb~1+absdegTDrerange*DiffSpeech*DiffGabor+(1+absdegTDrerange+DiffSpeech+DiffGabor|Participant),
                          data=behavioural_n1_main_NonTarget_reranged, family = binomial(link = "probit"), 
                          control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=40e5)))

summary(m_gb_td_glmm_full)

gg_m_gb_td_glmm_full<-ggpredict(m_gb_td_glmm_full, terms = c("absdegTDrerange[all]","DiffSpeech","DiffGabor")) # save the prediction from the model using ggpredict()
plot(gg_m_gb_td_glmm_full) # plot the model

### glmm_2 is the best model:
m_gb_td_glmm_2<- glmer(AccGb~1+absdegTDrerange*DiffSpeech*DiffGabor+(1+DiffGabor|Participant),
                       data=behavioural_n1_main_NonTarget_reranged, family = binomial(link = "logit"), 
                       control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=40e5)))



summary(m_gb_td_glmm_2)

gg_m_gb_td_glmm_2<-ggpredict(m_gb_td_glmm_2, terms = c("absdegTDrerange[all]","DiffSpeech","DiffGabor")) # save the prediction from the model using ggpredict()
plot(gg_m_gb_td_glmm_2) # plot the model


gg_m_gb_td_glmm_2_orirange <- gg_m_gb_td_glmm_2 %>%
  mutate(x_orirange=case_when(facet == "hard" ~ x+6,
                              facet == "easy" ~ x+48))

facet_labels<-c(easy = "Visual Easy", hard = "Visual Hard")
plot_m_gb_td_glmm_2_gg<-ggplot(gg_m_gb_td_glmm_2_orirange, aes(x=x_orirange, y=predicted, color=group,fill = group)) +
  geom_line(aes(x=x_orirange, y=predicted, colour = group), size=.6) +
  geom_ribbon(aes(ymin=conf.low, ymax=conf.high, x=x_orirange, y=predicted, color = group,fill = group), alpha = 0.2)+
  scale_y_continuous(breaks = seq(0, 1, by = 0.1))+
  scale_color_manual(labels = c("easy","hard"),values = c("#a18df8","#f8d38d"))+
  scale_fill_manual(labels = c("easy","hard"),values = c("#a18df8","#f8d38d"))+
  labs(x="Target-Distractor Angular Discrepancy (degree)", y = "Correct-rejection rate",color = "Speech Task",fill ="Speech Task")+
  theme_minimal()+
  facet_wrap(~ facet,labeller=labeller(facet = facet_labels),strip.position="bottom",scales = "free_x")+
  facetted_pos_scales(
    x = list(
      facet == "easy" ~ scale_x_continuous(breaks = seq(48, 60, by = 2)),
      facet == "hard" ~ scale_x_continuous(breaks = seq(6, 18, by = 2))
    )
  )


plot_m_gb_td_glmm_2_gg+
  theme(plot.title = element_text(size = 13,hjust=0.5), 
        axis.text.x = element_text(size=11,angle = 0, hjust = 0.5),
        axis.title.x = element_text(size=12),
        axis.title.y = element_text(size=12),
        legend.title = element_text(size=12),
        legend.text = element_text(size=11))

#### change the reference levels for post-hoc analysis:
m_gb_td_glmm_2_1<- glmer(AccGb~1+absdegTDrerange*DiffSpeech*relevel(as.factor(DiffGabor),ref = 'hard')+(1+DiffGabor|Participant),
                         data=behavioural_n1_main_NonTarget_reranged, family = binomial(link = "logit"), 
                         control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=40e5)))
summary(m_gb_td_glmm_2_1)


m_gb_td_glmm_2_2<- glmer(AccGb~1+absdegTDrerange*relevel(as.factor(DiffSpeech),ref = 'hard')*DiffGabor+(1+DiffGabor|Participant),
                         data=behavioural_n1_main_NonTarget_reranged, family = binomial(link = "logit"), 
                         control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=40e5)))
summary(m_gb_td_glmm_2_2)

m_gb_td_glmm_2_3<- glmer(AccGb~1+absdegTDrerange*relevel(as.factor(DiffSpeech),ref = 'hard')*relevel(as.factor(DiffGabor),ref = 'hard')+(1+DiffGabor|Participant),
                         data=behavioural_n1_main_NonTarget_reranged, family = binomial(link = "logit"), 
                         control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=40e5)))
summary(m_gb_td_glmm_2_3)



#### fit with afex

library(afex)
library(emmeans)
m_gb_td_glmm_2_afex<-(mixed(AccGb~1+absdegTDrerange*DiffSpeech*DiffGabor+(1+DiffGabor|Participant),
                            data=behavioural_n1_main_NonTarget_reranged, method = "LRT", family = binomial(link = "logit"), 
                            control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=40e5))))
summary(m_gb_td_glmm_2_afex)

(emm_m_sp_2_afex<-emmeans(m_gb_td_glmm_2_afex,"DiffSpeech","DiffGabor")) # estimation for task-wise performance using library(afex)
pairs(emm_m_sp_2_afex,adjust="holm") # pair-wise comparison results for task conditions

detach("package:afex", unload=TRUE)



## recall performance

library(afex)
library(emmeans)

m_dprime_afex<-aov_ez("Participant", "dprime", fmripilot_behav_n1_posttest_agg_AccMemory, within = c("DiffSpeech","DiffGabor"))

anova(m_dprime_afex)

detach("package:afex", unload=TRUE)
