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
## Note Jurg: it is not possible to investigate the interaction between quarter and neighbourhood on price, review score and listings, since neighbourhood and quarter are non-metric
HDF_cor <- cor(data_airbnb_uk_cleaned, use="pairwise.complete.obs")
HDF_cor
## Werk niet omdat niet alle variabelen in de dataset numeric zijn.

## price
anova_price_1 <- lm(price ~ quarter+neighbourhood_cleansed, data_airbnb_uk_cleaned)
Anova(anova_price_1, type = 3)

## review scores
anova_review_scores_1 <- lm(review_scores_rating_rescaled ~ quarter+neighbourhood_cleansed, data_airbnb_uk_cleaned)
Anova(anova_review_scores_1, type = 3)

## listings
anova_listings_1 <- lm(calculated_host_listings_count ~ quarter+neighbourhood_cleansed, data_airbnb_uk_cleaned)
Anova(anova_listings_1, type = 3)


# Effect size
eta_squared(anova_price_1, ci=0.95, partial = TRUE)

eta_squared(anova_review_score_1, ci=0.95, partial = TRUE)

eta_squared(anova_listings_1, ci=0.95, partial = TRUE)

## Look into the interaction between quarter and neighbourhood. Is it possible?



# Assumptions ANOVA
## Homoskedasticity and normality (plots)



## Results to gen/output folder


            