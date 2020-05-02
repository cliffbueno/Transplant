# Clean Analysis Script for Transplant Experiment
# Published in Ecology
# Code for Analyzing: Deschampsia biomass in Greenhouse, Year 1, Year 2

#### Libraries ####
library(Matrix)
library(lme4)
library(emmeans)
library(carData)
library(car)

#### Data ####
setwd("~/Desktop/CU/2Research/Transplant/Field/Year2")
alldes <- read.csv("Des_2016to2018_Pots.csv")
alldes$Year <- as.factor(alldes$Year)
alldes$Block <- as.factor(alldes$Block)
desgh <- subset(alldes, Year == "2016")
des17 <- subset(alldes, Year == "2017")
des18 <- subset(alldes, Year == "2018")
desgh$Ind <- as.factor(desgh$Ind)
des17$Ind <- as.factor(des17$Ind)
des18$Ind <- as.factor(des18$Ind)

#### Biomass ####
# Greenhouse
model <- lmer(BiomassPerInd ~ Inoculum + (1|Ind), data = desgh)
Anova(model) # Significant inoculum
emmeans(model, list(pairwise ~ Inoculum), adjust = "tukey")

model <- lmer(BiomassPerInd ~ Treatment + (1|Ind), data = desgh)
Anova(model) # Not significant treatment

# Year 1: Response = Difference in growth from Greenhouse
model <- lmer(BiomassPerIndDiff ~ Inoculum*GSL + (1|Block) + (1|Ind), data = des17)
Anova(model) # Significant inoculum and interaction
emmeans(model, list(pairwise ~ Inoculum), adjust = "tukey")

model <- lmer(BiomassPerIndDiff ~ Treatment*GSL + (1|Block) + (1|Ind), data = des17)
Anova(model) # Significant treatment

# Year 2: Response = Difference in growth from Year 1
model <- lmer(BiomassPerIndDiff ~ Inoculum*GSL + (1|Block) + (1|Ind), data = des18)
Anova(model) # Significant inoculum
emmeans(model, list(pairwise ~ Inoculum), adjust = "tukey")

model <- lmer(BiomassPerIndDiff ~ Treatment*GSL + (1|Block) + (1|Ind), data = des18)
Anova(model) # Significant treatment

