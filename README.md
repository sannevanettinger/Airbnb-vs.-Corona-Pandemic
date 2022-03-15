# Airbnb vs. The Corona Pandemic: How's Airbnb doing? 
## Introduction
Welcome to the "Airbnb vs. Corona Pandemic" repository!! Interested in the effects of the Corona Pandemic on the market of traveling and tourisme? Then you're in the right place!

It seems obvious that the Corona Pandemic, which finally seems to be coming to an end, has had the result of strongly reduced travel and overnight stays. Both locally and nationally. However, nothing could be further from the truth. There are certainly Airbnb hosts who have benefited from the Corona Pandemic. 

This README entails a detailed description on how to use the contents of this repository for future research. 

## Table of content
1. [Research motivation](#1-research-motivation)
2. [Setup of the repository](#2-setup-of-the-repository)
3. [Repository overview](#3-repository-overview)
4. [Software setup](#4-software-setup)
5. [Running instructions](#5-running-instructions)
6. [Research method](#6-research-method)
7. [Conclusion](#7-conclusion)

## 1. Research motivation
It is generally known that the impact of the Corona Pandemic on the traveling and tourism market has been enormous. Due to Corona measures, it even was almost impossible to travel between countries. However, the traveling and toerism market undergone some changes - either positively or negatively - over time.  

Whereas for many countries the Corona Pandemic played a huge role in daily life at the beginning of 2021, this was much less the case at the end of 2021. As the United Kingdom was one of the countries that let go of the Corona measures first. It is interesting to see whether there are certain changes in the traveling and tourism market in the United Kingdom. For this short research project the general question reads as follows: "*Which types of rooms in which neighbourhoods benefited the most from the Corona Pandemic in the United Kingdom?*"  
  
## 2. Setup of the repository  
![directory-tree-15-3-2022](https://user-images.githubusercontent.com/89737678/158386347-f50e5597-5963-4d81-8a38-cba3a8af399f.PNG)  
UPDATE: gen/analysis: Delete audit folder. Delete temp folder!! src/analysis: Delete file Analyze.R!!

## 3. Repository overview 
(CHECK IF DESCRIBED WELL, FOLDER/FILE NAMES)  
In the main branch of this GitHub repository, several folders/files are located: airbnb (folder), .gitignore, README.md and the general makefile. After running make, three subfolders will be visible in the "airbnb" folder: data, gen and src. 

The "**data**" folder holds the raw data (data_airbnb_uk.csv) after running make.  
The "**gen**" folder consists of another subfolder named "analysis". In gen/analysis two subfolders can be found: input and output. The "*input*" folder holds the cleaned dataset (data_airbnb_uk_cleaned.csv). The "*output*" folder holds the results of the performed analyses captured in PDF files.  
The "**src**" folder consists of two subfolders: analysis and data_preparation. In src/analysis the R-script to run the analyses (analysis_data_airbnb.R) can be found. In src/data_preparation, the following files can be found: the R-script to download the data from InsideAirbnb (downloading_data_airbnb.R), the RMarkdown script for data preparation (preparation_data_airbnb.Rmd) and the README with elaboration on choices made (README.md).  

## 4. Software setup 
* Download R-packages: plyr, dplyr, tidyverse, ggplot2, readr, googledrive, carat, data.table, R.utils, dint, zoo, summarytools, car, effectsize, emmeans,  agricolae. (*Important for Mac-users: Install XQuartz from www.xquarts.org*)
* Install GNU make: To install GNU make (both Mac and Windows users) go to this link: "https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/."  

## 5. Running instructions 
(CHECK IF DESCRIBED WELL, FOLDER NAMES)  
This repository contains a complete pipeline of downloading data, data exploration, data preparation and analyses. Therefore, as a first step make sure you've cloned the repository onto your own laptop/pc. The complete pipeline is automated using "GNU make". To run this pipeline, you first need to have installed "GNU make" (see Software Setup: install GNU make). After you have done this, you open your Command Prompt (Windows) or Terminal (Mac), move to the folder "Airbnb-vs.-Corona-Pandemic" using cd and run "make". The final output can be found in the "output" folder located in the "gen/analysis" folder.

## 6. Research method 
To address the aforementioned research question multiple AirBnB datasets, derived from InsideAirbnb, are combined to one big dataset containing data from three cities in the United Kingdom: London, Bristol and Great Manchester. In total 11 different datasets are combined, each containing information per quarter.  

However, the raw dataset contain lots of information, of which many is not needed to address the research question this repository is dedicated to. Therefore the data is cleaned and prepared for analyses. For more information about this read: <a href="airbnb/src/data_preparation/README.md">airbnb/src/data_preparation/README.md</a>   

In this research the following conceptual model applied:
![Conceptual-model-2-Airbnb-UK](https://user-images.githubusercontent.com/89737678/158207922-a82dcbc9-23d1-4146-9553-58ede7cbc343.PNG)

The variables "*review_scores_rating*", "*num_host_listings*", "*price*", "*room_type*", "*neighbourhood_name*" and "*quarter*" are the leading players in this research. For the analyses several *ANOVA analyses* were performed as the independent variable (i.e., quarters) is non-metric, and the dependent variables (i.e., listings, review score rating, and price) are metric. Moreover, to see whether the effect depends on the neighbourhood and room type, it was included as an interaction term.

## 7. Conclusion
(UNDER CONSTRUCTION)  
From our analysis we can conclude that, due to the easing of the corona restrictions mid 2021 in the United Kingdom, and the opening back up of the country, …
1. The price of an Airbnb on average increased by £18.77
2. The review score rating of an Airbnb on average decreased  by 0.11 
3. The number of Airbnb listings per host on average increased by 1.25
4. The review score rating of an Airbnb on average decreased by 0.07, 0.16, and 0.40 for entire homes / apartments, private rooms, and shared rooms respectively 
5. The number of Airbnb listings per host on average decreased by 3.85  

**plot_listings.pdf**
![plot_number_of_listings](https://user-images.githubusercontent.com/89737678/158396862-3da1acfd-0479-4864-a6ae-3e8e0cb6fe19.jpeg)
Figure: plot_listings.pdf

**plot_review_score.pdf**
![plot_review_score](https://user-images.githubusercontent.com/89737678/158396868-4ce77f28-7342-45f0-b3f2-abcd707825bf.jpeg)
Figure: plot_review_score.pdf

 
For more detailed information about the findings of the analyses read: <a href="airbnb/gen/analysis/README.md">airbnb/gen/analysis/README.md</a>   
