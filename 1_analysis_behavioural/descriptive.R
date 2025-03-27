# Author: Han Wang

## 25 March 2025: Prepared scripts for publication.
## 12 July 2024: Added dataframe and figure for analysis on Gabor orientation deviance vs response.



library(car)
library(tidyverse)

library(NISTunits)

library(ggplot2)
library(ggsci)
library(ggeffects)


# Define some variables

numtrial_pretrain_sp = 12
numtrial_pretrain_dual = 16
numtrial_maintrain = 16

numtrial_main = 288
numtrial_posttest = 128
numtrial_total = numtrial_pretrain_sp + numtrial_pretrain_dual + numtrial_maintrain + numtrial_main + numtrial_posttest

numConditions_pretrain_sp = 2
numConditions = 4

numtrial_pretrainSpPerCondition = numtrial_pretrain_sp/numConditions_pretrain_sp
numtrial_pretrainDualPerCondition = numtrial_pretrain_dual/numConditions
numtrial_maintrainPerCondition = numtrial_maintrain/numConditions
numtrial_mainPerCondition = numtrial_main/numConditions

# numtrial_pretrainPerCondition = numtrial_pretrain/numConditions
# numtrial_mainPerCondition = numtrial_main/numConditions



# Read the raw data

raw_fmripilot_behav_n1<-read.csv("220926_fmripilot_behav_n25.csv")

#raw_fmripilot_behav_n1_prenmain<-raw_fmripilot_behav_n1 %>%
#  filter(Subj_no != "sub-02",
#         Subj_no != "sub-04")


## Add a couple of variables: Trial, factor(Speech), factor(Gabor)

raw_fmripilot_behav_n1<-raw_fmripilot_behav_n1 %>%
  mutate(
    Trial = ifelse(Sequence %in% 1:.GlobalEnv$numtrial_pretrain_sp,Sequence,
                   ifelse(Sequence %in% (.GlobalEnv$numtrial_pretrain_sp+1):(.GlobalEnv$numtrial_pretrain_sp+.GlobalEnv$numtrial_pretrain_dual),
                          Sequence-.GlobalEnv$numtrial_pretrain_sp,
                          ifelse(Sequence %in% (.GlobalEnv$numtrial_pretrain_sp+.GlobalEnv$numtrial_pretrain_dual+1):(.GlobalEnv$numtrial_pretrain_sp+.GlobalEnv$numtrial_pretrain_dual+.GlobalEnv$numtrial_maintrain),
                                 Sequence-.GlobalEnv$numtrial_pretrain_sp-.GlobalEnv$numtrial_pretrain_dual,
                                 ifelse(Sequence %in% (.GlobalEnv$numtrial_pretrain_sp+.GlobalEnv$numtrial_pretrain_dual+.GlobalEnv$numtrial_maintrain+1):(.GlobalEnv$numtrial_pretrain_sp+.GlobalEnv$numtrial_pretrain_dual+.GlobalEnv$numtrial_maintrain+.GlobalEnv$numtrial_main),
                                        Sequence-.GlobalEnv$numtrial_pretrain_sp-.GlobalEnv$numtrial_pretrain_dual-.GlobalEnv$numtrial_maintrain,
                                        Sequence-.GlobalEnv$numtrial_pretrain_sp-.GlobalEnv$numtrial_pretrain_dual-.GlobalEnv$numtrial_maintrain-.GlobalEnv$numtrial_main))))
  ) %>%
  mutate(
    DiffSpeech = case_when(
      Block == 1 | Block == 2 ~ "easy",
      Block == 3 | Block == 4 ~ "hard"
    )
  ) %>%
  mutate(
    DiffGabor = case_when(
      Block == 1 | Block == 3 ~ "easy",
      Block == 2 | Block == 4 ~ "hard"
    )
  )

## filter participants for different sessions

raw_fmripilot_behav_n1_prenmain<-raw_fmripilot_behav_n1 %>%
  filter(Subj_no != "sub-02",
         Subj_no != "sub-04")

raw_fmripilot_behav_n1_post<-raw_fmripilot_behav_n1 %>%
  filter(Subj_no != "sub-01")


## Create separate spreadsheet for each session

### pre-train_sp session

fmripilot_behav_n1_pretrain_sp<-raw_fmripilot_behav_n1_prenmain %>%
  select(Participant,Sequence,Trial,Session,Run,Block,DiffSpeech,Sentence,SpContent,Keyword1,Keyword2,Keyword3,Keyword4,
         RespAud,AccAud,RTAud) %>%
  filter(Session == "pretrain",
         Run == 1) %>%
  mutate(
    Participant = factor(Participant),
    Sequence = as.numeric(Sequence),
    Trial = as.numeric(Trial),
    Session = factor(Session),
    Run = factor(Run),
    Block = factor(Block),
    DiffSpeech = factor(DiffSpeech),
    Sentence = factor(Sentence),
    RespAud = as.numeric(RespAud),
    AccAud = as.numeric(AccAud),
    RTAud = as.numeric(RTAud)
  )



### pre-train_dual session


fmripilot_behav_n1_pretrain_dual<-raw_fmripilot_behav_n1_prenmain %>%
  select(Participant,Sequence,Trial,Session,Run,Block,DiffSpeech,DiffGabor,Sentence,SpContent,Keyword1,Keyword2,Keyword3,Keyword4,
         RespAud,AccAud,RTAud,RespGb,AccGb,RTGb) %>%
  filter(Session == "pretrain",
         Run == 2) %>%
  mutate(
    Participant = factor(Participant),
    Sequence = as.numeric(Sequence),
    Trial = as.numeric(Trial),
    Session = factor(Session),
    Run = factor(Run),
    Block = factor(Block),
    DiffSpeech = factor(DiffSpeech),
    DiffGabor = factor(DiffGabor),
    Sentence = factor(Sentence),
    RespAud = as.numeric(RespAud),
    AccAud = as.numeric(AccAud),
    RTAud = as.numeric(RTAud),
    RespGb = as.numeric(RespGb),
    AccGb = as.numeric(AccGb),
    RTGb = as.numeric(RTGb)
  )

behavioural_n1_pretrain_dual_GbCorrect <- fmripilot_behav_n1_pretrain_dual %>%
  filter(RTAud != 9999 & AccGb == 1)

### main_train session

fmripilot_behav_n1_maintrain<-raw_fmripilot_behav_n1_prenmain %>%
  select(Participant,Sequence,Trial,Session,Run,Block,DiffSpeech,DiffGabor,Sentence,SpContent,Keyword1,Keyword2,Keyword3,Keyword4,
         RespAud,AccAud,RTAud,Orientation,TD,TargetPresence,RespGb,AccGb,RTGb) %>%
  filter(Session == "main",
         Run == 3) %>%
  mutate(
    Participant = factor(Participant),
    Sequence = as.numeric(Sequence),
    Trial = as.numeric(Trial),
    Session = factor(Session),
    Run = factor(Run),
    Block = factor(Block),
    DiffSpeech = factor(DiffSpeech),
    DiffGabor = factor(DiffGabor),
    Sentence = factor(Sentence),
    RespAud = as.numeric(RespAud),
    AccAud = as.numeric(AccAud),
    RTAud = as.numeric(RTAud),
    Orientation = as.numeric(Orientation),
    degOrientation = NISTradianTOdeg(Orientation),
    absdegOrientation = abs(NISTradianTOdeg(Orientation)),
    TD = as.numeric(TD),
    degTD = NISTradianTOdeg(TD),
    absdegTD = abs(NISTradianTOdeg(TD)),
    TargetPresence = as.numeric(TargetPresence),
    RespGb = as.numeric(RespGb),
    AccGb = as.numeric(AccGb),
    RTGb = as.numeric(RTGb)
  )

behavioural_n1_maintrain_GbCorrect <- fmripilot_behav_n1_maintrain %>%
  filter(RTAud != 9999 & AccGb == 1)



### main sessions

fmripilot_behav_n1_main<-raw_fmripilot_behav_n1_prenmain %>%
  select(Participant,Sequence,Trial,Session,Run,Block,DiffSpeech,DiffGabor,Sentence,SpContent,Keyword1,Keyword2,Keyword3,Keyword4,
         RespAud,AccAud,RTAud,Orientation,TD,TargetPresence,RespGb,AccGb,RTGb) %>%
  filter(Session == "main",
         Run %in% 4:9) %>%
  mutate(
    Participant = factor(Participant),
    Sequence = as.numeric(Sequence),
    Trial = as.numeric(Trial),
    Session = factor(Session),
    Run = factor(Run),
    Block = factor(Block),
    DiffSpeech = factor(DiffSpeech),
    DiffGabor = factor(DiffGabor),
    Sentence = factor(Sentence),
    RespAud = as.numeric(RespAud),
    AccAud = as.numeric(AccAud),
    RTAud = as.numeric(RTAud),
    Orientation = as.numeric(Orientation),
    degOrientation = NISTradianTOdeg(Orientation),
    absdegOrientation = abs(NISTradianTOdeg(Orientation)),
    TD = as.numeric(TD),
    degTD = NISTradianTOdeg(TD),
    absdegTD = abs(NISTradianTOdeg(TD)),
    TargetPresence = as.numeric(TargetPresence),
    RespGb = as.numeric(RespGb),
    AccGb = as.numeric(AccGb),
    RTGb = as.numeric(RTGb)
  )

behavioural_n1_main_GbCorrect <- fmripilot_behav_n1_main %>%
  filter(RTAud != 9999 & AccGb == 1)

behavioural_n1_main_NoNaNGb <- fmripilot_behav_n1_main %>%
  filter(RTGb != 9999)

behavioural_n1_main_Target <- fmripilot_behav_n1_main %>%
  filter(TargetPresence == 1)

behavioural_n1_main_Target_gbHard <- fmripilot_behav_n1_main %>%
  filter(TargetPresence == 0 & DiffGabor == "hard")


behavioural_n1_main_NonTarget <- fmripilot_behav_n1_main %>%
  filter(TargetPresence == 0)

behavioural_n1_main_NonTarget_reranged <- behavioural_n1_main_NonTarget %>%
  mutate(absdegTDrerange=case_when(DiffGabor == "hard" ~ absdegTD-6, 
                                   DiffGabor == "easy" ~ absdegTD-48))




### post-test session


fmripilot_behav_n1_posttest<-raw_fmripilot_behav_n1_post %>%
  select(Participant,Sequence,Trial,Session,Run,Block,DiffSpeech,DiffGabor,Sentence,SpContent,Keyword1,Keyword2,Keyword3,Keyword4,
         SentencePresence,RespMemory,AccMemory,RTMemory) %>%
  filter(Session == "posttest") %>%
  mutate(
    Participant = factor(Participant),
    Sequence = as.numeric(Sequence),
    Trial = as.numeric(Trial),
    Session = factor(Session),
    Run = factor(Run),
    Block = factor(Block),
    DiffSpeech = factor(DiffSpeech),
    DiffGabor = factor(DiffGabor),
    SentencePresence = as.numeric(SentencePresence),
    RespMemory = as.numeric(RespMemory),
    AccMemory = as.numeric(AccMemory),
    RTMemory = as.numeric(RTMemory)
  )



# Aggregate data and prepare for plotting

## Pretrain_Sp session

### Trialwise performance (for adaptation)

#### All trials
library(Rmisc)
fmripilot_behav_n1_pretrainSp_agg_AccAud_trialwise_all <- summarySE(fmripilot_behav_n1_pretrain_sp, measurevar="AccAud", groupvars=c("Trial")) # aggregate the raw data for plotting
detach("package:Rmisc", unload=TRUE)

#### Trial per Cond
fmripilot_behav_n1_pretrainSp_arranged<-arrange(fmripilot_behav_n1_pretrain_sp, Participant, DiffSpeech,Trial)
fmripilot_behav_n1_pretrainSp_arranged$TrialperCond<-1:numtrial_pretrainPerCondition # have smth called pretrainPerCondition here

library(Rmisc)
fmripilot_behav_n1_pretrainSp_agg_AccAud_trialwise_perCond <- summarySE(fmripilot_behav_n1_pretrainSp_arranged, measurevar="AccAud", groupvars=c("DiffSpeech","TrialperCond"))
detach("package:Rmisc", unload=TRUE)


# fmripilot_behav_n1_pretrainSp_agg_AccAud_trialwise_perCond_test<- fmripilot_behav_n1_pretrainSp_arranged %>% group_by(DiffSpeech,TrialperCond) %>% summarize(sum_size = sum(AccAud))


## Pretrain_Dual session

### Trialwise performance (for adaptation)

#### All trials
library(Rmisc)
fmripilot_behav_n1_pretrainDual_agg_AccAud_trialwise_all <- summarySE(fmripilot_behav_n1_pretrain_dual, measurevar="AccAud", groupvars=c("Trial")) # aggregate the raw data for plotting
fmripilot_behav_n1_pretrainDual_agg_AccGb_trialwise_all<-summarySE(fmripilot_behav_n1_pretrain_dual, measurevar="AccGb", groupvars=c("Trial"))
detach("package:Rmisc", unload=TRUE)

#### Trial per Cond
fmripilot_behav_n1_pretrainDual_arranged<-arrange(fmripilot_behav_n1_pretrain_dual, Participant, DiffSpeech,DiffGabor,Trial)
fmripilot_behav_n1_pretrainDual_arranged$TrialperCond<-1:numtrial_pretrainDualPerCondition # have smth called pretrainPerCondition here

library(Rmisc)
fmripilot_behav_n1_pretrainDual_agg_AccAud_trialwise_perCond <- summarySE(fmripilot_behav_n1_pretrainDual_arranged, measurevar="AccAud", groupvars=c("DiffSpeech","DiffGabor","TrialperCond"))
fmripilot_behav_n1_pretrainDual_agg_AccGb_trialwise_perCond <- summarySE(fmripilot_behav_n1_pretrainDual_arranged, measurevar="AccGb", groupvars=c("DiffSpeech","DiffGabor","TrialperCond"))
detach("package:Rmisc", unload=TRUE)


## Main-train session

### Overall performance

library(Rmisc)
fmripilot_behav_n1_maintrain_agg_AccAud <- summarySE(fmripilot_behav_n1_maintrain, measurevar="AccAud", groupvars=c("Participant","DiffSpeech","DiffGabor"))
fmripilot_behav_n1_maintrain_agg_RTAud <- summarySE(behavioural_n1_maintrain_GbCorrect, measurevar="RTAud", groupvars=c("Participant","DiffSpeech","DiffGabor"))
fmripilot_behav_n1_maintrain_agg_AccGb <- summarySE(fmripilot_behav_n1_maintrain, measurevar="AccGb", groupvars=c("Participant","DiffSpeech","DiffGabor"))
fmripilot_behav_n1_maintrain_agg_RTGb <- summarySE(behavioural_n1_maintrain_GbCorrect, measurevar="RTGb", groupvars=c("Participant","DiffSpeech","DiffGabor"))

detach("package:Rmisc", unload=TRUE)


### Trialwise performance (for adaptation)

#### All trials
library(Rmisc)
fmripilot_behav_n1_maintrain_agg_AccAud_trialwise_all <- summarySE(fmripilot_behav_n1_maintrain, measurevar="AccAud", groupvars=c("Trial")) # aggregate the raw data for plotting
fmripilot_behav_n1_maintrain_agg_AccGb_trialwise_all<-summarySE(fmripilot_behav_n1_maintrain, measurevar="AccGb", groupvars=c("Trial"))
detach("package:Rmisc", unload=TRUE)

#### Trial per Cond
fmripilot_behav_n1_maintrain_arranged<-arrange(fmripilot_behav_n1_maintrain, Participant, DiffSpeech,DiffGabor,Trial)
fmripilot_behav_n1_maintrain_arranged$TrialperCond<-rep(1:numtrial_maintrainPerCondition,length(unique(fmripilot_behav_n1_maintrain_arranged$Participant)))

library(Rmisc)
fmripilot_behav_n1_maintrain_agg_AccAud_trialwise_perCond <- summarySE(fmripilot_behav_n1_maintrain_arranged, measurevar="AccAud", groupvars=c("DiffSpeech","DiffGabor","TrialperCond"))
fmripilot_behav_n1_maintrain_agg_AccGb_trialwise_perCond <- summarySE(fmripilot_behav_n1_maintrain_arranged, measurevar="AccGb", groupvars=c("DiffSpeech","DiffGabor","TrialperCond"))
detach("package:Rmisc", unload=TRUE)





## Main session

### Overall performance

library(Rmisc)
fmripilot_behav_n1_main_agg_AccAud <- summarySE(fmripilot_behav_n1_main, measurevar="AccAud", groupvars=c("Participant","DiffSpeech","DiffGabor"))
fmripilot_behav_n1_main_agg_RTAud <- summarySE(behavioural_n1_main_GbCorrect, measurevar="RTAud", groupvars=c("Participant","DiffSpeech","DiffGabor"))
fmripilot_behav_n1_main_agg_AccGb <- summarySE(fmripilot_behav_n1_main, measurevar="AccGb", groupvars=c("Participant","DiffSpeech","DiffGabor"))
fmripilot_behav_n1_main_agg_RTGb <- summarySE(behavioural_n1_main_GbCorrect, measurevar="RTGb", groupvars=c("Participant","DiffSpeech","DiffGabor"))


fmripilot_behav_n1_main_agg_AccGb_noNaN <- summarySE(behavioural_n1_main_NoNaNGb, measurevar="AccGb", groupvars=c("Participant","DiffSpeech","DiffGabor"))

detach("package:Rmisc", unload=TRUE)


### Trialwise performance (for adaptation)

#### All trials
library(Rmisc)
fmripilot_behav_n1_main_agg_AccAud_trialwise_all <- summarySE(fmripilot_behav_n1_main, measurevar="AccAud", groupvars=c("Trial")) # aggregate the raw data for plotting
fmripilot_behav_n1_main_agg_AccGb_trialwise_all<-summarySE(fmripilot_behav_n1_main, measurevar="AccGb", groupvars=c("Trial"))
detach("package:Rmisc", unload=TRUE)

#### Trial per Cond
fmripilot_behav_n1_main_arranged<-arrange(fmripilot_behav_n1_main, Participant, DiffSpeech,DiffGabor,Trial)
fmripilot_behav_n1_main_arranged$TrialperCond<-rep(1:numtrial_mainPerCondition,length(unique(fmripilot_behav_n1_main_arranged$Participant)))

library(Rmisc)
fmripilot_behav_n1_main_agg_AccAud_trialwise_perCond <- summarySE(fmripilot_behav_n1_main_arranged, measurevar="AccAud", groupvars=c("DiffSpeech","DiffGabor","TrialperCond"))
fmripilot_behav_n1_main_agg_AccGb_trialwise_perCond <- summarySE(fmripilot_behav_n1_main_arranged, measurevar="AccGb", groupvars=c("DiffSpeech","DiffGabor","TrialperCond"))
detach("package:Rmisc", unload=TRUE)



## Post-test session

library(Rmisc)

fmripilot_behav_n1_posttest_agg_AccMemory <- summarySE(fmripilot_behav_n1_posttest, measurevar="AccMemory", groupvars=c("Participant","DiffSpeech","DiffGabor"))
fmripilot_behav_n1_posttest_agg_AccMemory<-fmripilot_behav_n1_posttest_agg_AccMemory %>%
  mutate(
    Hits = N*AccMemory,
    FalseAlarms = N-N*AccMemory,
    Misses = N-Hits,
    CorrectRejs = N-FalseAlarms
  )

detach("package:Rmisc", unload=TRUE)

### Get the correct values for false alarms to fill in the AccMemory aggregated form. 5 = # of conditions + 1 (1 is the FALSE ALARM ROW), 4 = # of conditions.

IdxFA<-(1:(nrow(fmripilot_behav_n1_posttest_agg_AccMemory)/5))*5
falseAlarms<-rep(fmripilot_behav_n1_posttest_agg_AccMemory[IdxFA,]$FalseAlarms,each = 4)
correctRejs<-rep(fmripilot_behav_n1_posttest_agg_AccMemory[IdxFA,]$CorrectRejs,each = 4)

fmripilot_behav_n1_posttest_agg_AccMemory<-fmripilot_behav_n1_posttest_agg_AccMemory[-IdxFA, ]
fmripilot_behav_n1_posttest_agg_AccMemory$FalseAlarms<-falseAlarms
fmripilot_behav_n1_posttest_agg_AccMemory$CorrectRejs<-correctRejs

dprimestats_fmripilot_behav_n1_posttest<-psycho::dprime(fmripilot_behav_n1_posttest_agg_AccMemory$Hits,
                                                        fmripilot_behav_n1_posttest_agg_AccMemory$FalseAlarms,
                                                        fmripilot_behav_n1_posttest_agg_AccMemory$Misses,
                                                        fmripilot_behav_n1_posttest_agg_AccMemory$CorrectRejs)

fmripilot_behav_n1_posttest_agg_AccMemory$dprime <- dprimestats_fmripilot_behav_n1_posttest$dprime






# Plot the data

## Pre-train Sp session

### Speech adaptation (accuracy)

#### All tasks aggregated

ggplot(fmripilot_behav_n1_pretrainSp_agg_AccAud_trialwise_all, aes(x=Trial, y=AccAud)) + 
  geom_errorbar(aes(ymin=AccAud-se, ymax=AccAud+se), width=.1) +
  geom_point() +
  geom_smooth(method="loess")+
  labs(title="Trial-wise accuracy of the speech task in practice phase (Error bars = ±1SE)",
       x="Trial number", y = "Accuracy")+
  theme_bw()

#### Adaptation per task

ggplot(fmripilot_behav_n1_pretrainSp_agg_AccAud_trialwise_perCond, aes(x=TrialperCond, y=AccAud)) + 
  geom_errorbar(aes(ymin=AccAud-se, ymax=AccAud+se), width=.1) +
  geom_point() +
  geom_smooth(method = "lm")+
  labs(title="Trial-wise accuracy of the speech task in practice phase (Error bars = ±1SE)",
       x="Trial number", y = "Accuracy")+
  facet_wrap(~DiffSpeech)+
  theme_bw()



## Pre-train Dual session

### Speech adaptation (accuracy)

#### All tasks aggregated

ggplot(fmripilot_behav_n1_pretrainDual_agg_AccAud_trialwise_all, aes(x=Trial, y=AccAud)) + 
  geom_errorbar(aes(ymin=AccAud-se, ymax=AccAud+se), width=.1) +
  geom_point() +
  geom_smooth(method="loess")+
  labs(title="Trial-wise accuracy of the speech task in practice phase (Error bars = ±1SE)",
       x="Trial number", y = "Accuracy")+
  theme_bw()

#### Adaptation per task

ggplot(fmripilot_behav_n1_pretrainDual_agg_AccAud_trialwise_perCond, aes(x=TrialperCond, y=AccAud)) + 
  geom_errorbar(aes(ymin=AccAud-se, ymax=AccAud+se), width=.1) +
  geom_point() +
  geom_smooth(method = "lm")+
  labs(title="Trial-wise accuracy of the speech task in practice phase (Error bars = ±1SE)",
       x="Trial number", y = "Accuracy")+
  facet_grid(DiffGabor~DiffSpeech,labeller = label_both)+
  theme_bw()


### Gabor adaptation (accuracy)

#### All tasks aggregated

ggplot(fmripilot_behav_n1_pretrainDual_agg_AccGb_trialwise_all, aes(x=Trial, y=AccGb)) + 
  geom_errorbar(aes(ymin=AccGb-se, ymax=AccGb+se), width=.1) +
  geom_point() +
  geom_smooth(method="loess")+
  labs(title="Trial-wise accuracy of the visual task in practice phase (Error bars = ±1SE)",
       x="Trial number", y = "Accuracy")+
  theme_bw()

#### Adaptation per task

ggplot(fmripilot_behav_n1_pretrainDual_agg_AccGb_trialwise_perCond, aes(x=TrialperCond, y=AccGb)) + 
  geom_errorbar(aes(ymin=AccGb-se, ymax=AccGb+se), width=.1) +
  geom_point() +
  geom_smooth(method = "lm")+
  labs(title="Trial-wise accuracy of the visual task in practice phase (Error bars = ±1SE)",
       x="Trial number", y = "Accuracy")+
  facet_grid(DiffGabor~DiffSpeech,labeller = label_both)+
  theme_bw()



## Main-Train session


### Speech adaptation (accuracy)

#### All tasks aggregated

ggplot(fmripilot_behav_n1_maintrain_agg_AccAud_trialwise_all, aes(x=Trial, y=AccAud)) + 
  geom_errorbar(aes(ymin=AccAud-se, ymax=AccAud+se), width=.1) +
  geom_point() +
  geom_smooth(method="loess")+
  labs(title="Trial-wise accuracy of the speech task in maintrain phase (Error bars = ±1SE)",
       x="Trial number", y = "Accuracy")+
  theme_bw()

#### Adaptation per task

ggplot(fmripilot_behav_n1_maintrain_agg_AccAud_trialwise_perCond, aes(x=TrialperCond, y=AccAud)) + 
  geom_errorbar(aes(ymin=AccAud-se, ymax=AccAud+se), width=.1) +
  geom_point() +
  geom_smooth(method = "loess")+
  labs(title="Trial-wise accuracy of the speech task in maintrain phase (Error bars = ±1SE)",
       x="Trial number", y = "Accuracy")+
  facet_grid(DiffGabor~DiffSpeech,labeller = label_both)+
  theme_bw()


### Gabor adaptation (accuracy)

#### All tasks aggregated

ggplot(fmripilot_behav_n1_maintrain_agg_AccGb_trialwise_all, aes(x=Trial, y=AccGb)) + 
  geom_errorbar(aes(ymin=AccGb-se, ymax=AccGb+se), width=.1) +
  geom_point() +
  geom_smooth(method="loess")+
  labs(title="Trial-wise accuracy of the visual task in maintrain phase (Error bars = ±1SE)",
       x="Trial number", y = "Accuracy")+
  theme_bw()

#### Adaptation per task

ggplot(fmripilot_behav_n1_maintrain_agg_AccGb_trialwise_perCond, aes(x=TrialperCond, y=AccGb)) + 
  geom_errorbar(aes(ymin=AccGb-se, ymax=AccGb+se), width=.1) +
  geom_point() +
  geom_smooth(method = "loess")+
  labs(title="Trial-wise accuracy of the visual task in maintrain phase (Error bars = ±1SE)",
       x="Trial number", y = "Accuracy")+
  facet_grid(DiffGabor~DiffSpeech,labeller = label_both)+
  theme_bw()




## Main session


### Speech adaptation (accuracy)

#### All tasks aggregated

ggplot(fmripilot_behav_n1_main_agg_AccAud_trialwise_all, aes(x=Trial, y=AccAud)) + 
  geom_errorbar(aes(ymin=AccAud-se, ymax=AccAud+se), width=.1) +
  geom_point() +
  geom_smooth(method="loess")+
  labs(title="Trial-wise accuracy of the speech task in main phase (Error bars = ±1SE)",
       x="Trial number", y = "Accuracy")+
  theme_bw()

#### Adaptation per task

ggplot(fmripilot_behav_n1_main_agg_AccAud_trialwise_perCond, aes(x=TrialperCond, y=AccAud)) + 
  geom_errorbar(aes(ymin=AccAud-se, ymax=AccAud+se), width=.1) +
  geom_point() +
  geom_smooth(method = "loess")+
  labs(title="Trial-wise accuracy of the speech task in main phase (Error bars = ±1SE)",
       x="Trial number", y = "Accuracy")+
  facet_grid(DiffGabor~DiffSpeech,labeller = label_both)+
  theme_bw()


### Gabor adaptation (accuracy)

#### All tasks aggregated

ggplot(fmripilot_behav_n1_main_agg_AccGb_trialwise_all, aes(x=Trial, y=AccGb)) + 
  geom_errorbar(aes(ymin=AccGb-se, ymax=AccGb+se), width=.1) +
  geom_point() +
  geom_smooth(method="loess")+
  labs(title="Trial-wise accuracy of the visual task in main phase (Error bars = ±1SE)",
       x="Trial number", y = "Accuracy")+
  theme_bw()

#### Adaptation per task

ggplot(fmripilot_behav_n1_main_agg_AccGb_trialwise_perCond, aes(x=TrialperCond, y=AccGb)) + 
  geom_errorbar(aes(ymin=AccGb-se, ymax=AccGb+se), width=.1) +
  geom_point() +
  geom_smooth(method = "loess")+
  labs(title="Trial-wise accuracy of the visual task in main phase (Error bars = ±1SE)",
       x="Trial number", y = "Accuracy")+
  facet_grid(DiffGabor~DiffSpeech,labeller = label_both)+
  theme_bw()




### Speech Accuracy

#### Fig. 3:

plot_fmripilot_behav_n1_main_AccAud<-ggplot(fmripilot_behav_n1_main_agg_AccAud, aes(x=DiffSpeech, y=AccAud,fill=DiffGabor)) +
  geom_boxplot(outlier.shape=NA)+
  stat_summary(aes(group=DiffGabor,fill = DiffGabor),fun = "mean", geom = "point", shape = 23, size = 3, fill = "grey",position = position_dodge(0.75)) +
  geom_point(aes(fill=DiffGabor),size=2,shape=21, position = position_jitterdodge(jitter.width = 0.25),alpha = 0.5)+
  scale_y_continuous(breaks = seq(0, 1, by = 0.1))+
  scale_fill_manual(name = "Visual Task",values = c("light blue","light pink"))+
  coord_cartesian(ylim = c(0, 1))+
  labs(x="Speech Task", y = "Proportion of 'understood'")+
  theme_minimal()


plot_fmripilot_behav_n1_main_AccAud+
  theme(plot.title = element_text(size = 13,hjust=0.5), 
        axis.text.x = element_blank(),
        axis.title.x = element_text(size=12),
        axis.title.y = element_text(size=12),
        strip.text.x = element_text(size = 11),
        legend.title = element_text(size=12),
        legend.text = element_text(size=11))



### Speech RT

plot_fmripilot_behav_n1_main_RTAud<-ggplot(fmripilot_behav_n1_main_agg_RTAud, aes(x=DiffGabor, y=RTAud*1000,fill=DiffGabor)) +
  geom_boxplot(outlier.shape=NA,width = 0.5)+
  stat_summary(fun = "mean", geom = "point", shape = 23, size = 3, fill = "grey") +
  geom_point(aes(fill=DiffGabor,group=Participant),size=2,shape=21, position = position_dodge(0.25),alpha = 0.5)+
  scale_y_continuous(breaks = seq(0, 800, by = 100))+
  geom_line(aes(group=Participant), position = position_dodge(0.25), alpha = 0.4) +
  scale_fill_manual(name = "2ndary Task",values = c("light blue","light pink"))+
  coord_cartesian(ylim = c(0, 800))+
  labs(title="Speech task RT in the dual task",
       x="Speech Task", y = "RT (ms)")+
  theme_minimal()+
  facet_wrap(~DiffSpeech,strip.position="bottom")


plot_fmripilot_behav_n1_main_RTAud+
  theme(plot.title = element_text(size = 13,hjust=0.5), 
        axis.text.x = element_blank(),
        axis.title.x = element_text(size=12),
        axis.title.y = element_text(size=12),
        strip.text.x = element_text(size = 11),
        legend.title = element_text(size=12),
        legend.text = element_text(size=11))


### Visual task accuracy: Fig. 4.

plot_fmripilot_behav_n1_main_AccGb<-ggplot(fmripilot_behav_n1_main_agg_AccGb, aes(x=DiffSpeech, y=AccGb,fill=DiffSpeech)) +
  geom_boxplot(outlier.shape=NA,width = 0.5)+
  stat_summary(fun = "mean", geom = "point", shape = 23, size = 3, fill = "grey") +
  geom_point(aes(fill=DiffSpeech,group=Participant),size=2,shape=21, position = position_dodge(0.25),alpha = 0.5)+
  scale_y_continuous(breaks = seq(0, 1, by = 0.1))+
  geom_line(aes(group=Participant), position = position_dodge(0.25), alpha = 0.4) +
  scale_fill_manual(name = "Speech Task",values = c("light blue","light pink"))+
  coord_cartesian(ylim = c(0, 1))+
  labs(x="Visual Task", y = "Accuracy")+
  theme_minimal()+
  facet_wrap(~DiffGabor,strip.position="bottom")


plot_fmripilot_behav_n1_main_AccGb+
  theme(plot.title = element_text(size = 13,hjust=0.5), 
        axis.text.x = element_blank(),
        axis.title.x = element_text(size=12),
        axis.title.y = element_text(size=12),
        strip.text.x = element_text(size = 11),
        legend.title = element_text(size=12),
        legend.text = element_text(size=11))


### Secondary task RT

plot_fmripilot_behav_n1_main_RTGb<-ggplot(fmripilot_behav_n1_main_agg_RTGb, aes(x=DiffSpeech, y=RTGb*1000,fill=DiffSpeech)) +
  geom_boxplot(outlier.shape=NA,width = 0.5)+
  stat_summary(fun = "mean", geom = "point", shape = 23, size = 3, fill = "grey") +
  geom_point(aes(fill=DiffSpeech,group=Participant),size=2,shape=21, position = position_dodge(0.25),alpha = 0.5)+
  scale_y_continuous(breaks = seq(0, 800, by = 100))+
  geom_line(aes(group=Participant), position = position_dodge(0.25), alpha = 0.4) +
  scale_fill_manual(name = "Speech Task",values = c("light blue","light pink"))+
  coord_cartesian(ylim = c(0, 800))+
  labs(title="Visual task RT in the dual task",
       x="Visual Task", y = "RT(ms)")+
  theme_minimal()+
  facet_wrap(~DiffGabor,strip.position="bottom")


plot_fmripilot_behav_n1_main_RTGb+
  theme(plot.title = element_text(size = 13,hjust=0.5), 
        axis.text.x = element_blank(),
        axis.title.x = element_text(size=12),
        axis.title.y = element_text(size=12),
        strip.text.x = element_text(size = 11),
        legend.title = element_text(size=12),
        legend.text = element_text(size=11))




## Post-test session

### d-prime plot: Fig. C1.

plot_fmripilot_behav_n1_posttest_dprime<-ggplot(fmripilot_behav_n1_posttest_agg_AccMemory, aes(x=DiffGabor, y=dprime,fill=DiffGabor)) +
  geom_boxplot(outlier.shape=NA,width = 0.5)+
  stat_summary(fun = "mean", geom = "point", shape = 23, size = 3, fill = "grey") +
  geom_point(aes(fill=DiffGabor,group=Participant),size=2,shape=21, position = position_dodge(0.25),alpha = 0.5)+
  scale_y_continuous(breaks = seq(-0.8, 1.2, by = 0.1))+
  geom_line(aes(group=Participant), position = position_dodge(0.25), alpha = 0.4) +
  scale_fill_manual(name = "Visual Task",values = c("light blue","light pink"))+
  coord_cartesian(ylim = c(-0.8, 1.2))+
  labs(x="Speech Task", y = "Sensitivity (d')")+
  theme_minimal()+
  facet_wrap(~DiffSpeech,strip.position="bottom")


plot_fmripilot_behav_n1_posttest_dprime+
  theme(plot.title = element_text(size = 13,hjust=0.5), 
        axis.text.x = element_blank(),
        axis.title.x = element_text(size=12),
        axis.title.y = element_text(size=12),
        strip.text.x = element_text(size = 11),
        legend.title = element_text(size=12),
        legend.text = element_text(size=11))