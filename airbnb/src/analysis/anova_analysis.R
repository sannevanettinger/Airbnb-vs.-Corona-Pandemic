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
     
#Save Anova output
capture.output(Anova(anova1, type = 3),  file = "../output/anova1_airbnb.doc")
capture.output(Anova(anova2, type = 3),  file = "../output/anova2_airbnb.doc")
capture.output(Anova(anova3, type = 3),  file = "../output/anova3_airbnb.doc")
capture.output(summary(mod1),  file = "../output/mod1_airbnb.doc")
capture.output(summary(mod2),  file = "../output/mod2_airbnb.doc")
capture.output(summary(mod3),  file = "../output/mod3_airbnb.doc")


#The above part can be kept, below not


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


            