## ANALYSIS & INTERPRETATION
To see whether an anova was allowed to be performed, several assumptions had to be tested: homogeneity of variance, normality of the distribution and independence of observations. For this, we set up an sample of 5000 observations.

_**Homogeneity of variance**_

From the Levene's Test we can conclude that the variance among the groups are approximately equal, since all of the variables are higher than 0.05.

_**Normality of the distribution**_

From the Shapiro Wilk normality test we can conclude that all of the variables in the sample are not normally distributed, since all of the variables have a p-value smaller than 0.05. As a result, the normality is violated for all variables, however, this is not a problem for conducting and interpreting the ANOVA analyses since we have a large sample size. 

_**Independence of observations**_

Independence of observations is only achieved if the experiment is set up correctly. That is, when the sample is randomly selected. Since we have used the function 'sample_n' to collect 5000 observations in a newly created data frame, we can conclude that the observations are independent and we can continue with the ANOVA analyses.

_**ANOVA price and quarter**_

From the ANOVA we can conclude that there is a significant relationship between the variable quarters and price (p<0,001). This leads us to conclude that the corona pandemic had a significant effect on the price of an Airbnb. However, from the eta squared test, we can conclude that this affect was very small. To get more insight into the difference per quarter, a Tukey test was performed. From this test we can see that there is a significant difference in paired  means for each quarter combination, except for the combination quarter 2 and 3. Moreover, we can see that the mean difference in price between quarter 1 and quarter 4 was 18.77. This leads us to conclude that due to the easing in corona restrictions, and the opening back up of the country, the prices for an Airbnb on average increased quite a lot. 

_**ANOVA review score rating and quarter**_

From the ANOVA we can conclude that there is a significant relationship between the variable quarters and review score rating (p<0,001). This leads us to conclude that the corona pandemic had a significant effect on the review score rating of an Airbnb. However, from the eta squared test, we can conclude that this affect was very small. To get more insight into the difference per quarter, a Tukey test was performed. From this test we can see that there is a significant difference in paired means for each quarter combination. Moreover, we can see that the mean difference in review score rating between quarter 1 and quarter 4 is -0.11. This leads us to conclude that due to the easing in corona restrictions, and the opening back up of the country, the review score rating for an Airbnb on average decreased by 0.11. 

_**ANOVA number of listings and quarter**_

From the ANOVA we can conclude that there is a significant relationship between the variable quarters and number of listings (p<0.05). However, compared to the other two ANOVAs, the relationship is less significant as it only significant at a p-value smaller than 0.05 as supposed to 0.001. This leads us to conclude that the corona pandemic had a significant effect on the number of listings of an Airbnb. However, from the eta squared test, we can conclude that this affect was very small. To get more insight into the difference per quarter, a Tukey test was performed. From this test we can see that there is only a significant difference in paired means between quarter 1 and 3, more specifically an increase of 1.25. As there is no significant difference between the rest of the quarters, we have to interpret this with caution. However, as the corona restrictions were quite a bit more relaxed in quarter 3 compared to quarter 1 of 2021, we can to some extend still conclude that due to the easing in corona restrictions, and the opening back up of the country, the number of Airbnb listings increased. 

_**ANOVA with interaction quarter * neighbourhood**_

From the ANOVAs with the interaction between quarter and neighborhood, we can conclude that there is no significant relationship between this interaction variable and the price, review score ratings, and number of listings. This leads us to conclude that the effect of the corona pandemic on the price, review score rating, and number of listings of  an Airbnb, did not significantly differ between different neighborhoods in the United Kingdom. 