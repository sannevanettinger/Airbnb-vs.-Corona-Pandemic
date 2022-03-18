# ANOVA ANALYSIS

# Load the R-packages
library(car)
library(effectsize)
library(emmeans)
library(agricolae)
library(dplyr)
library(data.table)
library(ggplot2)

## Import the cleaned data
data_airbnb_uk_cleaned <- data.frame(fread("../../gen/analysis/input/data_airbnb_uk_cleaned.csv"))

# Charactarize independent variables
data_airbnb_uk_cleaned$quarter <- as.factor(data_airbnb_uk_cleaned$quarter)

# Assumptions ANOVA
# Randomly selecting 5000 rows from the dataset to investigate homoskedasticity and normality
data_airbnb_uk_cleaned_sample <- sample_n(data_airbnb_uk_cleaned, 5000)

# Homoskedasticity
## neighbourhood
leveneTest(price ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample)
leveneTest(review_scores_rating_rescaled ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample)
leveneTest(num_host_listings ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample)

## room_type
leveneTest(price ~ quarter*room_type, data_airbnb_uk_cleaned_sample)
leveneTest(review_scores_rating_rescaled ~ quarter*room_type, data_airbnb_uk_cleaned_sample)
leveneTest(num_host_listings ~ quarter*room_type, data_airbnb_uk_cleaned_sample)

# Normality
shapiro.test(data_airbnb_uk_cleaned_sample$price)
shapiro.test(data_airbnb_uk_cleaned_sample$review_scores_rating_rescaled)
shapiro.test(data_airbnb_uk_cleaned_sample$num_host_listings)

# ANOVA with quarter as independent variable and price, review_scores_rating_rescaled, and calculated_host_listings_count as dependent variables
anova_1 <- aov(price ~ quarter, data_airbnb_uk_cleaned)
summary(anova_1)

anova_2 <- aov(review_scores_rating_rescaled ~ quarter, data_airbnb_uk_cleaned)
summary(anova_2)

anova_3 <- aov(num_host_listings ~ quarter, data_airbnb_uk_cleaned)
summary(anova_3)

# Effect size for the ANOVAs
eta_squared(anova_1, ci=0.95, partial = TRUE)

eta_squared(anova_2, ci=0.95, partial = TRUE)

eta_squared(anova_3, ci=0.95, partial = TRUE)

# Post hoc test: Tukey Test
TukeyHSD(anova_1)

TukeyHSD(anova_2)

TukeyHSD(anova_3)

# Moderation effect of neighbourhood and room_type (Note: Loading the moderators will take some time)
## Neighbourhood
mod1 <- aov(price ~ quarter*neighbourhood_name, data = data_airbnb_uk_cleaned)
summary(mod1)

mod2 <- aov(review_scores_rating_rescaled ~ quarter*neighbourhood_name, data = data_airbnb_uk_cleaned)
summary(mod2)

mod3 <- aov(num_host_listings ~ quarter*neighbourhood_name, data = data_airbnb_uk_cleaned)
summary(mod3)

## Room_type
mod5 <- aov(review_scores_rating_rescaled ~ quarter*room_type, data = data_airbnb_uk_cleaned)
summary(mod5)

mod6 <- aov(num_host_listings ~ quarter*room_type, data = data_airbnb_uk_cleaned)
summary(mod6)

# Tukey tests for moderation effect
TukeyHSD(mod5)

TukeyHSD(mod6)

# Effect size of the ANOVAs with moderation effect
eta_squared(mod5, ci=0.95, partial = TRUE)

eta_squared(mod6, ci=0.95, partial = TRUE)

# Create output directory
dir.create("../../gen/analysis/output/")

# Plot review_score over time
pdf("../../gen/analysis/output/plot_review_score.pdf")
data_airbnb_uk_cleaned$quarter <- as.numeric(data_airbnb_uk_cleaned$quarter)
dt_review_score <- as.data.table(data_airbnb_uk_cleaned)
plot_review_score <- dt_review_score[, .(mean_review_score = mean(review_scores_rating_rescaled)), 
                                     by = .(quarter, room_type)]

ggplot(data = plot_review_score, aes(x = quarter, y = mean_review_score)) +
  geom_line(aes(color = room_type, linetype = room_type)) +
  geom_point(aes(color = room_type, linetype = room_type)) +
  ggtitle("Change in review score in 2021 per room type") +
  xlab("Quarters 2021") +
  ylab("Review score") +
  ylim(0, 5)
dev.off()

# Plot number of listings over time
pdf("../../gen/analysis/output/plot_listings.pdf")
dt_listings <- as.data.table(data_airbnb_uk_cleaned)
plot_listings <- dt_listings[, .(mean_listings = mean(num_host_listings)), 
                             by = .(quarter, room_type)]

ggplot(data = plot_listings, aes(x = quarter, y = mean_listings)) +
  geom_line(aes(color = room_type, linetype = room_type)) +
  geom_point(aes(color = room_type, linetype = room_type)) +
  ggtitle("Change in number of listings in 2021 per room type") +
  xlab("Quarters 2021") +
  ylab("Number of listings") +
  ylim(0, 100)
dev.off()

# Save ANOVA & assumptions output
## ANOVA
capture.output(summary(anova_1),  file = "../../gen/analysis/output/anova1_airbnb.doc")
capture.output(summary(anova_2),  file = "../../gen/analysis/output/anova2_airbnb.doc")
capture.output(summary(anova_3),  file = "../../gen/analysis/output/anova3_airbnb.doc")
capture.output(summary(mod1),  file = "../../gen/analysis/output/mod1_airbnb.doc")
capture.output(summary(mod2),  file = "../../gen/analysis/output/mod2_airbnb.doc")
capture.output(summary(mod3),  file = "../../gen/analysis/output/mod3_airbnb.doc")
capture.output(summary(mod5),  file = "../../gen/analysis/output/mod5_airbnb.doc")
capture.output(summary(mod6),  file = "../../gen/analysis/output/mod6_airbnb.doc")

## Eta squared
### ANOVA, quarter as IV
capture.output(eta_squared(anova_1, ci=0.95, partial = TRUE), file = "../../gen/analysis/output/eta_squared_anova1_airbnb.doc")
capture.output(eta_squared(anova_2, ci=0.95, partial = TRUE), file = "../../gen/analysis/output/eta_squared_anova2_airbnb.doc")
capture.output(eta_squared(anova_3, ci=0.95, partial = TRUE), file = "../../gen/analysis/output/eta_squared_anova3_airbnb.doc")

### ANOVA, quarter as IV and moderation effect of room_type
capture.output(eta_squared(mod5, ci=0.95, partial = TRUE), file = "../../gen/analysis/output/eta_squared_mod5_airbnb.doc")
capture.output(eta_squared(mod6, ci=0.95, partial = TRUE), file = "../../gen/analysis/output/eta_squared_mod6_airbnb.doc")

## Post hoc test
capture.output(TukeyHSD(anova_1),  file = "../../gen/analysis/output/tukeytest_anova1_airbnb.doc")
capture.output(TukeyHSD(anova_2),  file = "../../gen/analysis/output/tukeytest_anova2_airbnb.doc")
capture.output(TukeyHSD(anova_3),  file = "../../gen/analysis/output/tukeytest_anova3_airbnb.doc")
capture.output(TukeyHSD(mod5), file = "../../gen/analysis/output/tukeytest_mod5_airbnb.doc")
capture.output(TukeyHSD(mod6), file = "../../gen/analysis/output/tukeytest_mod6_airbnb.doc")

## Anova assumptions
capture.output(leveneTest(price ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample), file = "../../gen/analysis/output/levene_test1_airbnb.doc")
capture.output(leveneTest(review_scores_rating_rescaled ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample), file = "../../gen/analysis/output/levene_test2_airbnb.doc")
capture.output(leveneTest(num_host_listings ~ quarter*neighbourhood_name, data_airbnb_uk_cleaned_sample), file = "../../gen/analysis/output/levene_test3_airbnb.doc")
capture.output(leveneTest(price ~ quarter*room_type, data_airbnb_uk_cleaned_sample), file = "../../gen/analysis/output/levene_test4_airbnb.doc")
capture.output(leveneTest(review_scores_rating_rescaled ~ quarter*room_type, data_airbnb_uk_cleaned_sample), file = "../../gen/analysis/output/levene_test5_airbnb.doc")
capture.output(leveneTest(num_host_listings ~ quarter*room_type, data_airbnb_uk_cleaned_sample), file = "../../gen/analysis/output/levene_test6_airbnb.doc")
capture.output(shapiro.test(data_airbnb_uk_cleaned_sample$price), file = "../../gen/analysis/output/shapiro_test1_airbnb.doc")
capture.output(shapiro.test(data_airbnb_uk_cleaned_sample$review_scores_rating_rescaled), file = "../../gen/analysis/output/shapiro_test2_airbnb.doc")
capture.output(shapiro.test(data_airbnb_uk_cleaned_sample$num_host_listings), file = "../../gen/analysis/output/shapiro_test3_airbnb.doc")

# Create temp file 
dir.create('../../gen/analysis/temp/', recursive=T)
sink('../../gen/analysis/temp/analysis.log')
cat('done')
sink()