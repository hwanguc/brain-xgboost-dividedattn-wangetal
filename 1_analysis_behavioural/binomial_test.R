library(dplyr)
library(ggplot2)

set.seed(10)

# Fig 9A: Binomial test for the whole-brain model:

n_test<-5760
n_sample<-100
onesample_chance<-25
allsample_chance<-32
observed_acc<-42

binomial_data <- rbinom(n_test, n_sample, onesample_chance/100)
binomial_data <- as.data.frame(binomial_data)
names(binomial_data) <- c('data')

binomial_data %>% ggplot() + 
  geom_histogram(aes(x = data, 
                     y = stat(count / sum(count))),
                 binwidth = 2.5,
                 color = 'black') +
  xlim(0, 50)+
  geom_vline(aes(xintercept = onesample_chance,
                 color = "one_sample_chance"),
             size = 1, 
             linetype = 'dashed') +
  geom_vline(aes(xintercept = allsample_chance,
                 color = "all_sample_chance"),
             size = 1, 
             linetype = 'dashed')+
  geom_vline(aes(xintercept = observed_acc,
                 color = "observed_accuracy"),
             size = 1, 
             linetype = 'dashed') +
  scale_y_continuous(limits=c(0,0.3), breaks=seq(0,0.3, by = 0.05))+
  scale_color_manual(name = "Scores", values = c(one_sample_chance = "orange", all_sample_chance = "green", observed_accuracy = "darkblue"),
                     breaks=c('one_sample_chance', 'all_sample_chance', 'observed_accuracy'),
                     labels = c('One-sample chance level: 25/100', 'All-sample chance level: 32/100','Observed score: 42/100'))+
  theme_bw()+
  theme(legend.position = c(0.23, 0.86)) +
  labs(x = 'Number of successful classifications for 100 images',
       y = 'Proportion')


### Probability for observing a higher accuracy than 42% given the H0 is true
1-pbinom(42, 100, 0.25)

### Probability for observing a higher accuracy than 32% given the H0 is true (all-sample chance level)
1-pbinom(32, 100, 0.25)

# Fig 12A: binomial test for binomial classification model with 13-selected features:

n_sample<-50
onesample_chance<-25
allsample_chance<-32
observed_acc<-c(76,76,72,74)/100*n_sample

binomial_data <- rbinom(n_test, n_sample, 0.5)
binomial_data <- as.data.frame(binomial_data)
names(binomial_data) <- c('data')

binomial_data %>% ggplot() + 
  geom_histogram(aes(x = data, 
                     y = stat(count / sum(count))),
                 binwidth = 1,
                 color = 'black') +
  xlim(0, 50)+
  geom_vline(aes(xintercept = onesample_chance,
                 color = "one_sample_chance"),
             size = 1, 
             linetype = 'dashed') +
  geom_vline(aes(xintercept = allsample_chance,
                 color = "all_sample_chance"),
             size = 1, 
             linetype = 'dashed')+
  geom_vline(aes(xintercept = observed_acc[1],
                 color = "observed_accuracy"),
             size = 0.7, 
             linetype = 'dashed') +
  geom_vline(aes(xintercept = observed_acc[2],
                 color = "observed_accuracy"),
             size = 0.7, 
             linetype = 'dashed') +
  geom_vline(aes(xintercept = observed_acc[3],
                 color = "observed_accuracy"),
             size = 0.7, 
             linetype = 'dashed') +
  geom_vline(aes(xintercept = observed_acc[4],
                 color = "observed_accuracy"),
             size = 0.7, 
             linetype = 'dashed')+
  scale_y_continuous(limits=c(0,0.15), breaks=seq(0,0.15, by = 0.05))+
  scale_color_manual(name = "Scores", values = c(one_sample_chance = "orange", all_sample_chance = "green", observed_accuracy = "darkblue"),
                     breaks=c('one_sample_chance', 'all_sample_chance', 'observed_accuracy'),
                     labels = c('One-sample chance level: 25/50', 'All-sample chance level: 32/50','Observed scores'))+
  theme_bw()+
  theme(legend.position = c(0.23, 0.86)) +
  labs(x = 'Number of successful classifications for 50 images',
       y = 'Proportion')


### Probability for observing a higher accuracy than 60% given the H0 is true (all-sample chance level)
1-pbinom(32, 50, 0.5)
