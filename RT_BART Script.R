#Load Data

rm(list = ls())

library(foreign)
library(haven)
library(dbarts)
library(ggplot2)
library(tibble)
library(broom)
library(margins)
library(Ecdat)
library(ggeffects)
library(dplyr)
library(dotwhisker)

study_rt<- read.dta("RTMachon_Jan2019.dta") 
glimpse(study_rt)


study_rt <- 
  study_rt %>% 
  select(cynic_pcf, conspiracy, age, passedtests, ideo,
         investigate, dem_threat,white, party7, 
         female, gen3, party_main, educ, treatments, screen, screen2) %>% 
  na.omit()

rt1 <- study_rt %>% mutate(treatments = "Control")
rt2 <- study_rt %>% mutate(treatments = "Information")
rt3 <- study_rt %>% mutate(treatments = "Source")
rt4 <- study_rt %>% mutate(treatments = "Inoculation")

bart_df_rt <- bind_rows(rt1, rt2, rt3, rt4)
bart_df_rt$treatments <- as.factor(bart_df_rt$treatments)

bart_model <- dbarts(formula = cynic_pcf ~ as.factor(treatments) + as.factor(female) + as.factor(gen3) + as.factor(party_main) + as.factor(educ) + white, test = bart_df_rt, data = study_rt)
bart_fit_1_1 <- bart_model$run()

prep_bart_fit_rt <-
  function(bart_fit, study_df) {
    n <- nrow(study_df)
    bart_test <- plyr::alply(bart_fit$test, 3)
    bart_test <- do.call(cbind, bart_test)
    pos_mat <- bart_test[(n + 1):(2 * n),] - bart_test[1:n,]
    neg_mat <-bart_test[((2 * n) + 1):(3 * n),] - bart_test[1:n,]
    
    gg_info <-
      tibble(
        tau_hat = apply(pos_mat, 1, mean),
        ci_upper = apply(pos_mat, 1, quantile, 0.975),
        ci_lower = apply(pos_mat, 1, quantile, 0.025),
        ordering = rank(tau_hat, ties.method = "first"), 
        treatment = "Information"
      )
    
    gg_inoc <-
      tibble(
        tau_hat = apply(neg_mat, 1, mean),
        ci_upper = apply(neg_mat, 1, quantile, 0.975),
        ci_lower = apply(neg_mat, 1, quantile, 0.025),
        ordering = rank(tau_hat, ties.method = "first"), 
        treatment = "Inoculation"
      )
    
    gg_source <-
      tibble(
        tau_hat = apply(neg_mat, 1, mean),
        ci_upper = apply(neg_mat, 1, quantile, 0.975),
        ci_lower = apply(neg_mat, 1, quantile, 0.025),
        ordering = rank(tau_hat, ties.method = "first"), 
        treatment = "Source"
      )
    

    gg_df <- bind_rows(gg_inoc, gg_info, gg_source)
  }

g_base <-
  ggplot(data = NULL, aes(tau_hat, ordering)) +
  geom_point(alpha = .05) +
  geom_errorbarh(aes(xmin = ci_lower, xmax = ci_upper),
                 alpha = .05,
                 height = 0) +
  geom_vline(xintercept = 0, lty = 2) +
  xlab("Estimated Treatment Effect") +
  facet_wrap( ~ treatment) +
  theme_bw() +
  theme(
    axis.title.y = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    strip.background = element_blank(),
    panel.grid.minor.y = element_blank(), 
    panel.grid.major.x = element_blank(),
    plot.title = element_text(hjust = 0.5)
  ) 

df_1_1 <- prep_bart_fit_rt(bart_fit_1_1, study_df = study_rt)
g_1_1 <- g_base %+% df_1_1 + ggtitle("Political Cynicism")
g_1_1

rm(list = ls())

library(foreign)
library(haven)
library(dbarts)
library(ggplot2)
library(tibble)
library(broom)
library(margins)
library(Ecdat)
library(ggeffects)
library(dplyr)
library(dotwhisker)

study_rt<- read.dta("RTMachon_Jan2019.dta") 
glimpse(study_rt)


study_rt <- 
  study_rt %>% 
  select(cynic_pcf, conspiracy, age, passedtests, ideo,
         investigate, dem_threat,white, party7, 
         female, gen3, party_main, educ, treatments, screen, screen2) %>% 
  na.omit()

rt1 <- study_rt %>% mutate(treatments = "Control")
rt2 <- study_rt %>% mutate(treatments = "Information")
rt3 <- study_rt %>% mutate(treatments = "Source")
rt4 <- study_rt %>% mutate(treatments = "Inoculation")

bart_df_rt <- bind_rows(rt1, rt2, rt3, rt4)
bart_df_rt$treatments <- as.factor(bart_df_rt$treatments)

bart_model <- dbarts(formula = conspiracy ~ as.factor(treatments) + as.factor(female) + as.factor(gen3) + as.factor(party_main) + as.factor(educ) + white, test = bart_df_rt, data = study_rt)
bart_fit_1_1 <- bart_model$run()

prep_bart_fit_rt <-
  function(bart_fit, study_df) {
    n <- nrow(study_df)
    bart_test <- plyr::alply(bart_fit$test, 3)
    bart_test <- do.call(cbind, bart_test)
    pos_mat <- bart_test[(n + 1):(2 * n),] - bart_test[1:n,]
    neg_mat <-bart_test[((2 * n) + 1):(3 * n),] - bart_test[1:n,]
    
    gg_info <-
      tibble(
        tau_hat = apply(pos_mat, 1, mean),
        ci_upper = apply(pos_mat, 1, quantile, 0.975),
        ci_lower = apply(pos_mat, 1, quantile, 0.025),
        ordering = rank(tau_hat, ties.method = "first"), 
        treatment = "Information"
      )
    
    gg_inoc <-
      tibble(
        tau_hat = apply(neg_mat, 1, mean),
        ci_upper = apply(neg_mat, 1, quantile, 0.975),
        ci_lower = apply(neg_mat, 1, quantile, 0.025),
        ordering = rank(tau_hat, ties.method = "first"), 
        treatment = "Inoculation"
      )
    
    gg_source <-
      tibble(
        tau_hat = apply(neg_mat, 1, mean),
        ci_upper = apply(neg_mat, 1, quantile, 0.975),
        ci_lower = apply(neg_mat, 1, quantile, 0.025),
        ordering = rank(tau_hat, ties.method = "first"), 
        treatment = "Source"
      )
    
    
    gg_df <- bind_rows(gg_inoc, gg_info, gg_source)
  }

g_base <-
  ggplot(data = NULL, aes(tau_hat, ordering)) +
  geom_point(alpha = .05) +
  geom_errorbarh(aes(xmin = ci_lower, xmax = ci_upper),
                 alpha = .05,
                 height = 0) +
  geom_vline(xintercept = 0, lty = 2) +
  xlab("Estimated Treatment Effect") +
  facet_wrap( ~ treatment) +
  theme_bw() +
  theme(
    axis.title.y = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    strip.background = element_blank(),
    panel.grid.minor.y = element_blank(), 
    panel.grid.major.x = element_blank(),
    plot.title = element_text(hjust = 0.5)
  ) 

df_1_1 <- prep_bart_fit_rt(bart_fit_1_1, study_df = study_rt)
g_1_1 <- g_base %+% df_1_1 + ggtitle("Conspiritorial Attitudes")
g_1_1





