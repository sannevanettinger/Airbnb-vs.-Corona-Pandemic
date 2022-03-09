# ANOVA ANALYSIS

# Installing and loading the packages
install.packages("car")
install.packages("effectsize")
library(car)
library(effectsize)

## Import the cleaned data
setwd("../../data")
data_airbnb_uk_cleaned <- read.csv("data_airbnb_uk_cleaned.csv")

# Charactarize independent variables: levels
data_airbnb_uk_cleaned$quarter <- as.factor(data_airbnb_uk_cleaned$quarter)

## Anova with just quarter as independent variable.
anova_price <- lm(price ~ quarter, data_airbnb_uk_cleaned)
Anova(anova_price, type = 3)

anova_review_score <- lm(review_scores_rating_rescaled ~ quarter, data_airbnb_uk_cleaned)
Anova(anova_review_score, type = 3)

anova_listings <- lm(calculated_host_listings_count ~ quarter, data_airbnb_uk_cleaned)
Anova(anova_listings, type = 3)

# Effect size
eta_squared(anova_price, ci=0.95, partial = TRUE)

eta_squared(anova_review_score, ci=0.95, partial = TRUE)

eta_squared(anova_listings, ci=0.95, partial = TRUE)

## Anova with quarter and neighbourhood as IV's
## Check for multicollinearity between quarter and neighbourhood


anova_price_1 <- lm(price ~ quarter+neighbourhood_cleansed, data_airbnb_uk_cleaned)
Anova(anova_price_1, type = 3)

## review scores

## listings


# Effect size
eta_squared(anova_price_1, ci=0.95, partial = TRUE)

            