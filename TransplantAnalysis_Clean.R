# Clean Analysis Script for Transplant Experiment
# Accepted in Ecology
# Code for Analyzing: Greenhouse, Year 1, Year 2 Survival and Biomass, Fungal Colonization, and microbial communities

# Libraries and Data
library(Matrix)
library(lme4)
library(plyr)
library(ggplot2)
library(nlme)
library(car)
library(mvtnorm)
library(survival)
library(TH.data)
library(MASS)
library(multcomp)
library(lmerTest)
library(estimability)
library(PMCMR)
library(emmeans)
library(scales)
library(lmtest)
library(rcompanion)
setwd("~/Desktop/CU/2Research/Transplant/Field/Year2")
source("~/Desktop/Functions/Summary.R")
alldes <- read.csv("Des_2016to2018_Pots.csv")
alldes$Year <- as.factor(alldes$Year)
alldes$Block <- as.factor(alldes$Block)
desgh <- subset(alldes, Year == "2016")
des17 <- subset(alldes, Year == "2017")
des18 <- subset(alldes, Year == "2018")
field <- subset(alldes, Year != "2016")
desgh$Ind <- as.factor(desgh$Ind)
des17$Ind <- as.factor(des17$Ind)
des18$Ind <- as.factor(des18$Ind)

### Analysis
# Cleaning...coming soon
