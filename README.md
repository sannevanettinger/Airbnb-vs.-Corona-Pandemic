# Airbnb vs. The Corona Pandemic: How's Airbnb doing? 
## Introduction
Welcome to the "Airbnb vs. Corona Pandemic" repository!!

Interested in the effects of the Corona Pandemic on the market of traveling and tourisme? Then you're in the right place!

It seems obvious that the Corona Pandemic, which finally seems to be coming to an end, has had the result of strongly reduced travel and overnight stays. Both locally and nationally. However, nothing could be further from the truth. There are certainly Airbnb hosts who have benefited from the Corona Pandemic. 

This README entails a detailed description on how to the contents of this repository for future research. 

## CONTENT (ADD LINKS?? OTHERWISE TABLE OF CONTENT)
1. Research motivation
2. Setup of the repository
3. Repository overview
4. Software setup
5. Running instructions
6. Research method
7. Conclusion


## 1. Research motivation
It is generally known that the impact of the Corona Pandemic on the traveling and tourism market has been enormous. Due to Corona measures, it even was almost impossible to travel between countries. However, the traveling and toerism market undergone some changes - either positively or negatively - over time.  

Whereas for many countries the Corona Pandemic played a huge role in daily life at the beginning of 2021, this was much less the case at the end of 2021. As the United Kingdom was one of the countries that let go of the Corona measures first. It is interesting to see whether there are certain changes in the traveling and tourism market in the United Kingdom. For this short research project the general question reads as follows: "*Which types of rooms in which neighbourhoods benefited the most from the Corona Pandemic in London, United Kingdom?*"  
  
## 2. Setup of the repository  
TEXT: Display overview of the repsitory.  

## 3. Repository overview 
TEXT  

## 4. Software setup 
* Download R-packages: plyr, dplyr, tidyverse, ggplot2, readr, googledrive, carat, data.table, R.utils, dint, zoo, summarytools, car, effectsize, emmeans,  agricolae. (*Important for Mac-users: Install XQuartz from www.xquarts.org*)
* Install GNU make: To install GNU make (both Mac and Windows users) go to this link: "https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/."  

## 5. Running instructions 
TEXT

The complete pipeline of downloading data, data exploration, data preparation and analyses is automated using "GNU make". To run this pipeline, you first need to have installed "GNU make" (see Softwar Setup: install GNU make). ...



## 6. Research method 
To address the aforementioned research question multiple AirBnB datasets, derived from InsideAirbnb, are combined to one big dataset containing data from three cities in the United Kingdom: London, Bristol and Great Manchester. In total 11 different datasets are combined, each containing information per quarter.  

However, the raw dataset contain lots of information, of which many is not needed to address the research question this repository is dedicated to. Therefore the data is cleaned and prepared for analyses. For more information about this read: <a href="airbnb/src/data_preparation/README.md">airbnb/src/data_preparation/README.md</a>   

In this research the following conceptual model applied:
![Conceptual-model-2-Airbnb-UK](https://user-images.githubusercontent.com/89737678/158207922-a82dcbc9-23d1-4146-9553-58ede7cbc343.PNG)

The variables "*review_scores_rating*", "*num_host_listings*", "*price*", "*room_type*", "*neighbourhood_name*" and "*quarter*" are the leading players in this research. For the analyses several *ANOVA analyses* were performed as the independent variable (i.e., quarters) is non-metric, and the dependent variables (i.e., listings, review score rating, and price) are metric. Moreover, to see whether the effect depends on the neighbourhood and room type, it was included as an interaction term.

## 7. Conclusion
From our analysis we can conclude that, due to the easing of the corona restrictions mid 2021, and the opening back up of the country, …
•	The price of an Airbnb on average increased by £18.77
•	The review score rating of an Airbnb on average decreased  by 0.11 
•	The number of Airbnb listings per host on average increased by 1.25
•	The review score rating of an Airbnb on average decreased by 0.07, 0.16, and 0.40 for entire homes / apartments, private rooms, and shared rooms respectively 
•	The number of Airbnb listings per host on average decreased by 3.85

(ADD LINK README IN GEN/ANALYSIS FOLDER)  
For more detailed information about the findings of the analyses read: <a href="airbnb/gen/analysis/README.md">airbnb/gen/analysis/README.md</a>   
