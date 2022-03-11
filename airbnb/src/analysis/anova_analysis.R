# ANOVA ANALYSIS

# Installing and loading the packages
install.packages("car")
install.packages("effectsize")
library(car)
library(effectsize)

## Import the cleaned data
setwd("../gen/analysis/input")
data_airbnb_uk_cleaned <- read.csv("data_airbnb_uk_cleaned.csv")

# Charactarize independent variables
data_airbnb_uk_cleaned$quarter <- as.factor(data_airbnb_uk_cleaned$quarter)

## Anova with quarter as independent variable and price, review_scores_rating_rescaled, and calculated_host_listings_count as dependent variables
anova1 <- lm(price ~ quarter, data_airbnb_uk_cleaned)
Anova(anova1, type = 3)

anova2 <- lm(review_scores_rating_rescaled ~ quarter, data_airbnb_uk_cleaned)
Anova(anova2, type = 3)

anova3 <- lm(num_host_listings ~ quarter, data_airbnb_uk_cleaned)
Anova(anova3, type = 3)

# Effect size for the Anova's
eta_squared(anova_price, ci=0.95, partial = TRUE)

eta_squared(anova_review_score, ci=0.95, partial = TRUE)

eta_squared(anova_listings, ci=0.95, partial = TRUE)

#Moderation effect of neighbourhood (be patient when loading the moderators)
mod1 <- aov(price ~ quarter*neighbourhood_name, data = data_airbnb_uk_cleaned)
summary(mod1)

mod2 <- aov(review_scores_rating_rescaled ~ quarter*neighbourhood_name, data = data_airbnb_uk_cleaned)
summary(mod2)

mod3 <- aov(num_host_listings ~ quarter*neighbourhood_name, data = data_airbnb_uk_cleaned)
summary(mod3)
     
# Assumptions ANOVA
# Randomly selecting 5000 rows from the dataset to investigate homoskedasticity and normality
data_airbnb_uk_cleaned_sample <- sample_n(data_airbnb_uk_cleaned, 5000)

# homoskedasticity
leveneTest(price ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample)
leveneTest(review_scores_rating_rescaled ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample)
leveneTest(num_host_listings ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample)

## all of the values in the Levene's Test are higher than 0.05, so we can not reject the null hypothesis (variances are equal). In other words, there is homoskedasticity for all the variables.

# normality
shapiro.test(data_airbnb_uk_cleaned_sample$price)
shapiro.test(data_airbnb_uk_cleaned_sample$review_scores_rating_rescaled)
shapiro.test(data_airbnb_uk_cleaned_sample$num_host_listings)

## Since all the p-values of the Shapiro-Wilk normality test are lower than 0.05, it can be concluded that the data is NOT normally distributed.


#Save Anova & assumptions output
## Anova
capture.output(Anova(anova1, type = 3),  file = "../output/anova1_airbnb.doc")
capture.output(Anova(anova2, type = 3),  file = "../output/anova2_airbnb.doc")
capture.output(Anova(anova3, type = 3),  file = "../output/anova3_airbnb.doc")
capture.output(summary(mod1),  file = "../output/mod1_airbnb.doc")
capture.output(summary(mod2),  file = "../output/mod2_airbnb.doc")
capture.output(summary(mod3),  file = "../output/mod3_airbnb.doc")

## Anova assumptions
capture.output(leveneTest(price ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample), file = "../output/levene_test1_airbnb.doc")
capture.output(leveneTest(review_scores_rating_rescaled ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample), file = "../output/levene_test2_airbnb.doc")
capture.output(leveneTest(num_host_listings ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample), file = "../output/levene_test3_airbnb.doc")
capture.output(shapiro.test(data_airbnb_uk_cleaned_sample$price), file = "../shapiro_test1_airbnb.doc")
capture.output(shapiro.test(data_airbnb_uk_cleaned_sample$review_scores_rating_rescaled), file = "../shapiro_test2_airbnb.doc")
capture.output(shapiro.test(data_airbnb_uk_cleaned_sample$num_host_listings), file = "../shapiro_test3_airbnb.doc")

#The above part can be kept, below not
