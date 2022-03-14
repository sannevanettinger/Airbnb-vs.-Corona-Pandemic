# ANOVA ANALYSIS

# Installing and loading the packages
install.packages("car")
install.packages("effectsize")
install.packages("emmeans")
install.packages("agricolae")
install.packages("dplyr")
library(car)
library(effectsize)
library(emmeans)
library(agricolae)
library(dplyr)

## Import the cleaned data
setwd("../../gen/analysis/input")
data_airbnb_uk_cleaned <- read.csv("data_airbnb_uk_cleaned.csv")

# Charactarize independent variables
data_airbnb_uk_cleaned$quarter <- as.factor(data_airbnb_uk_cleaned$quarter)
data_airbnb_uk_cleaned$quarter <- factor(data_airbnb_uk_cleaned$quarter, levels=c(1,2,3,4), labels=c("quarter_1", "quarter_2", "quarter_3", "quarter_4"))

# Assumptions ANOVA
# Randomly selecting 5000 rows from the dataset to investigate homoskedasticity and normality
data_airbnb_uk_cleaned_sample <- sample_n(data_airbnb_uk_cleaned, 5000)

# homoskedasticity
leveneTest(price ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample)
leveneTest(review_scores_rating_rescaled ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample)
leveneTest(num_host_listings ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample)

# normality
shapiro.test(data_airbnb_uk_cleaned_sample$price)
shapiro.test(data_airbnb_uk_cleaned_sample$review_scores_rating_rescaled)
shapiro.test(data_airbnb_uk_cleaned_sample$num_host_listings)

#ANOVA with quarter as independent variable and price, review_scores_rating_rescaled, and calculated_host_listings_count as dependent variables
anova_1 <- aov(price ~ quarter, data_airbnb_uk_cleaned)
summary(anova_1)

anova_2 <- aov(review_scores_rating_rescaled ~ quarter, data_airbnb_uk_cleaned)
summary(anova_2)

anova_3 <- aov(num_host_listings ~ quarter, data_airbnb_uk_cleaned)
summary(anova_3)

#Effect size for the ANOVAs
eta_squared(anova_1, ci=0.95, partial = TRUE)

eta_squared(anova_2, ci=0.95, partial = TRUE)

eta_squared(anova_3, ci=0.95, partial = TRUE)

#Post hoc test: Tukey Test
TukeyHSD(anova_1)

TukeyHSD(anova_2)

TukeyHSD(anova_3)

#Moderation effect of neighbourhood (be patient when loading the moderators)
mod1 <- aov(price ~ quarter*neighbourhood_name, data = data_airbnb_uk_cleaned)
summary(mod1)

mod2 <- aov(review_scores_rating_rescaled ~ quarter*neighbourhood_name, data = data_airbnb_uk_cleaned)
summary(mod2)

mod3 <- aov(num_host_listings ~ quarter*neighbourhood_name, data = data_airbnb_uk_cleaned)
summary(mod3)

#Save ANOVA & assumptions output
## ANOVA
capture.output(summary(anova_1),  file = "../output/anova1_airbnb.doc")
capture.output(summary(anova_2),  file = "../output/anova2_airbnb.doc")
capture.output(summary(anova_3),  file = "../output/anova3_airbnb.doc")
capture.output(summary(mod1),  file = "../output/mod1_airbnb.doc")
capture.output(summary(mod2),  file = "../output/mod2_airbnb.doc")
capture.output(summary(mod3),  file = "../output/mod3_airbnb.doc")

##Post hoc test
capture.output(TukeyHSD(anova_1),  file = "../output/tukeytest_anova1_airbnb.doc")
capture.output(TukeyHSD(anova_2),  file = "../output/tukeytest_anova2_airbnb.doc")
capture.output(TukeyHSD(anova_3),  file = "../output/tukeytest_anova3_airbnb.doc")

## Anova assumptions
capture.output(leveneTest(price ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample), file = "../output/levene_test1_airbnb.doc")
capture.output(leveneTest(review_scores_rating_rescaled ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample), file = "../output/levene_test2_airbnb.doc")
capture.output(leveneTest(num_host_listings ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample), file = "../output/levene_test3_airbnb.doc")
capture.output(shapiro.test(data_airbnb_uk_cleaned_sample$price), file = "../shapiro_test1_airbnb.doc")
capture.output(shapiro.test(data_airbnb_uk_cleaned_sample$review_scores_rating_rescaled), file = "../shapiro_test2_airbnb.doc")
capture.output(shapiro.test(data_airbnb_uk_cleaned_sample$num_host_listings), file = "../shapiro_test3_airbnb.doc")


