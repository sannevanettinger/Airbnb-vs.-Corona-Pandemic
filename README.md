# Airbnb vs. The Corona Pandemic: How's Airbnb doing? 

## Research motivation
It seems obvious that the Corona Pandemic, which finally seems to be coming to an end, has had the result of strongly reduced travel and overnight stays. Both locally and nationally. However, nothing could be further from the truth. There are certainly Airbnb hosts who have benefited from the Corona Pandemic. This research focusses mainly on the following research question: "*Which types of rooms in which neighbourhoods benefited the most from the Corona Pandemic in London, United Kingdom?*" However, later on the content of this research can be used for other research on this topic for any other city. This research will be assessed based on three elements: (1) _**the number of listings**_, (2) _**the score of the reviews**_ and/or (3) _**price increases**_. To concretize the research, the different (1) _**room types**_ and (2) _**neighbourhoods**_ are considered.  

The aforementioned research question is based on the available data from the Airbnb dataset. Initially, the research is done using multiple Airbnb datasets from London, United Kingdom. In total four different datasets are combined, each containing information per quarter. Due to limitations in the availability of datasets, as only the different datasets of 2021 are accessible without request and payment issues, it is not possible for this research to compare different years. However, the research will be delivered in such a way that any city - out of Airbnb's dataset - can be filled in to arrive at the requested data.  

This research benefits three stakeholders: (1) potential Airbnb hosts, (2) current Airbnb hosts looking to expand their offer and (3) Airbnb itself. The former can gain insight into their preferred city to what type of room they can most effectively offer and in which neighborhood. In so doing, they can best match the changes from the Corona Pandemic to the needs of the traveler. Airbnb can gain insight into supply and demand, adjust to it in whatever way it can, and also advertise more optimally on its website and via the app.  

Finally, the team decided to compare data of the beginning of 2021 with the end of 2021. Whereas for many countries the Corona Pandemic played a huge role in daily life at the beginning of 2021, this was much less the case at the end of 2021. For example, the relaxation of strict measures in the United Kingdom from July 18, 2021 (Gutiérrez, P., Duncan, P., Kirk, A., Robyn, M., McIntyre, N., Thomas, T., Blights, G., 2021). The figure below gives extra details on how the United Kingdom loosend their Corona measures in 2021 towards a normal situation like the situation before Corona ever happend.  

![Timeline-of-UK-government-cornavirus-lockdown-and-measures-2021](https://user-images.githubusercontent.com/89737678/154754883-9f6c9a0a-2b67-49fa-ae82-bbfda4ac0af7.PNG)  
Figure 1: Timeline Corona Lockdown And Measures In The United Kingdom (Institute Of Government, 2022)   
  
## Research method
As mentioned above, this research focused on how Airbnb was affected by the corona pandemic. More specifically, it analyzed how the number of listings, the review score rating, and the price were influenced by the corona pandemic. Moreover, it was considered whether some neighborhoods were more effected than others. To analyze this, several *ANOVA analyses* were performed as the independent variable (i.e., quarters) is non-metric, and the dependent variables (i.e., listings, review score rating, and price) are metric. Moreover, to see whether the affect dependent on the neighborhood, it was included as an interaction term.

## Analysis and interpretation

To see whether an anova was allowed to be performed, several assumptions had to be tested…

_**ANOVA price and quarter**_

From the ANOVA we can conclude that there is a significant relationship between the variable quarters and price (p<0,001). This leads us to conclude that the corona pandemic had a significant effect on the price of an Airbnb. However, from the eta squared test, we can conclude that this affect was very small. To get more insight into the difference per quarter, a Tukey test was performed. From this test we can see that there is a significant difference in paired  means for each quarter combination, except for the combination quarter 2 and 3. Moreover, we can see that the mean difference in price between quarter 1 and quarter 4 was 18.77. This leads us to conclude that due to the easing in corona restrictions, and the opening back up of the country, the prices for an Airbnb on average increased quite a lot. 

_**ANOVA review score rating and quarter**_

From the ANOVA we can conclude that there is a significant relationship between the variable quarters and review score rating (p<0,001). This leads us to conclude that the corona pandemic had a significant effect on the review score rating of an Airbnb. However, from the eta squared test, we can conclude that this affect was very small. To get more insight into the difference per quarter, a Tukey test was performed. From this test we can see that there is a significant difference in paired means for each quarter combination. Moreover, we can see that the mean difference in review score rating between quarter 1 and quarter 4 is -0.11. This leads us to conclude that due to the easing in corona restrictions, and the opening back up of the country, the review score rating for an Airbnb on average decreased by 0.11. 

_**ANOVA number of listings and quarter**_

From the ANOVA we can conclude that there is a significant relationship between the variable quarters and number of listings (p<0.05). However, compared to the other two ANOVAs, the relationship is less significant as it only significant at a p-value smaller than 0.05 as supposed to 0.001. This leads us to conclude that the corona pandemic had a significant effect on the number of listings of an Airbnb. However, from the eta squared test, we can conclude that this affect was very small. To get more insight into the difference per quarter, a Tukey test was performed. From this test we can see that there is only a significant difference in paired means between quarter 1 and 3, more specifically an increase of 1.25. As there is no significant difference between the rest of the quarters, we have to interpret this with caution. However, as the corona restrictions were quite a bit more relaxed in quarter 3 compared to quarter 1 of 2021, we can to some extend still conclude that due to the easing in corona restrictions, and the opening back up of the country, the number of Airbnb listings increased. 

_**ANOVA with interaction quarter * neighborhood**_

From the ANOVAs with the interaction between quarter and neighborhood, we can conclude that there is no significant relationship between this interaction variable and the price, review score ratings, and number of listings. This leads us to conclude that the effect of the corona pandemic on the price, review score rating, and number of listings of  an Airbnb, did not significantly differ between different neighborhoods in the United Kingdom.

----

Literature:  
* Gutiérrez, P., Duncan, P., Kirk, A., Robyn, M., McIntyre, N., Thomas, T., Blights, G. (2021). *Covid: how has the pandemic changed in the UK in 2021?* [Article] Retrieved from: https://www.theguardian.com/world/ng-interactive/2021/dec/22/covid-how-has-the-pandemic-changed-in-the-uk-in-2021 
* Institute Of Government (2022). *Timeline of UK goverment coronavirus lockdown and measures 2021*. Retrieved from: https://www.instituteforgovernment.org.uk/charts/uk-government-coronavirus-lockdowns
