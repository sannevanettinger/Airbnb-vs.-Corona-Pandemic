# Data Exploration & Preparation: Elaboration choices 
## Content 
1. Data Exploration  
1.1 Explore raw data using summary statistics  
1.2 Detect the origin of missing values   

2. Data Preparation  
2.1 Create new variables as reference to the quarterly data  
2.2 Delete unnecessary columns  
2.3 Rename variables "neighbourhood_cleansed" and "calculated_host_listings_count"  
2.4 Rescale the variable "review_scores_rating"  
2.5 Change the variable "price" to numeric  
2.6 Removing NA's from the dataset  
2.7 Detect outliers in the data  

3. After cleaning

## 1. Data Exploration
### 1.1 Explore raw data using summary statistics
From the summary statistics the following results can be derived:  

**Statistics observations per city**  
The original dataset (raw data) contains 71,325 observations divided over the three cities: London, Great Manchester and Bristol. 
![Summary-statistics-OVERALL-small](https://user-images.githubusercontent.com/89737678/157667408-d26551bb-e5df-4131-8567-a6e6f810ecd5.PNG)

**Statistics LONDON: Neighbourhoods and room types**  
The original dataset contains 52,986 observations in London. The observations of London are spread over 33 different neighbourhoods. 
![Summary-statistics-LONDON](https://user-images.githubusercontent.com/89737678/157626260-de898dd6-eab6-41fc-923c-95713a75a8dc.PNG)  

**Statistics GREAT MANCHESTER: Neighbourhoods and room types**  
The original dataset contains 13,597 observations in Great Manchester. The observations of Manchester are spread over 41 different neighbourhoods. 
![Summary-statistics-GREAT-MANCHESTER](https://user-images.githubusercontent.com/89737678/157626257-bd2d93ab-6610-4c8c-9431-ce0efe931d6d.PNG)  

**Statistics BRISTOL: Neighbourhoods and room types**  
The original dataset contains 4,741 observations in Bristol. The observations of Bristol are spread over 34 different neighbourhoods. 
![Summary-statistics-BRISTOL](https://user-images.githubusercontent.com/89737678/157626252-edf4a0f4-b5f2-44a4-bcff-6fa6a4e77a7d.PNG)

The summary statistics indicate that the dataset contains approximately 90,000 NA's (= missing values) regarding the variables related to the review score. Besides that, it is also noticed that the range of the variable "review_scores_rating" is out of proportion. Another issue that can be observed from the summary statistics is that the variable "price" is captured as a character, while it should be captured as a numeric. 

### 1.2 Detect the origin of missing values
From the summary statistics can be observed that the variable “review_scores_rating” contains many NA’s (= missing values), to be more precise 90,040. This is approximately 30% of the observations. As this is already one-fifth of the observations, an attempt was made to maybe discover the origin of the missing values in the variable “review_score_rating”. For this the variables host_is_superhost (i.e. whether or not the host is a superhost) and host_since (i.e. since when the host joined AirBnB) have been used. However, no clear cause for the missing values was found. 


## 2. Data Preparation
### 2.1 Create new variables as reference to the quarterly data
As the data of 2021 is collected per quarter, and the purpose of this research is to compare different time periods, several new variables named "quarter", "year" and "year_quarter" should be created. By doing this, a distinction can be made between the different periods in time. 

### 2.2 Delete unnecessary columns
As this research focuses on the main question "Which types of rooms in which neighbourhoods benefited the most from the Corona Pandemic in the United Kingdom?", some variables in the original dataset might not be needed to come to an answer. For that reason only the following variables are kept in the dataset to maintain a clear overview of the variables needed for this research:
* id: Airbnb's unique identifier for the listing.
* city: The city in which the Airbnb is located. 
* quarter: The quarter in which the Airbnb is listed.
* year: The year in which the Airbnb is listed. 
* year_quarter: The year and quarter in which in the Airbnb is listed.  
* neighbourhood_cleansed: The neighbourhood in which the Airbnb is located. 
* room_type: The type of room the Airbnb offers. 
* calculated_host_listings_count: The number of listings the host has in the current scrape, in the city / region geography. 
* review_scores_rating: The overall rating of the Airbnb based on the review scores on a 0 to 5 scale.
* price: The price at which the Airbnb is listed.

### 2.3 Rename variables "neighbourhood_cleansed" and "calculated_host_listings_count"
The variable names of "neighbourhood_cleansed" and "calculated_host_listings_count" are not revealing much of what they stand for. Therefore, these two variables need to be renamed so that their names are informative by themselves:
* neighbourhood_cleansed is from now on referred to as neighbourhood_name
* alculated_host_listings_count is from now on referred to as num_host_listings

### 2.4 Rescale the variable "review_scores_rating"
During the data exploration it was observed that the range of the variable "review_scores_rating" was a bit out of proportion. By inspecting the data it becomes clear that the range of this variables has changed over time. In quarter 1 of 2021 the variable "review_scores_rating" ranges between 0 and 100. However, in the following quarters (2, 3 and 4) the variable "review_scores_rating" ranges between 0 and 5. This will lead to problems while analyzing the data. Therefore this needs to be taken care off by rescaling the variable.

### 2.5 Change the variable "price" to numeric
From the data exploration became clear that the variable "price" in this data is imported as a character. For further analyses the variable "price" needs to be changed into a numeric. Before this can be done the dollar sign and the comma for prices above thousand had to be removed. 

### 2.6 Remove NA's from the dataset
In the data exploration attention was paid to NA's (= missing values) in the data, specific for the variable review_rating_score, by means of plots and summary statistics. From the plots and summary statistics it remains unclear what the direct cause is of the missing values in the dataset. However, it is expected that the missing values of the variable review_rating_score are caused by guests that do not write a review. As the observations with the missing values cannot be used for further analyses, they have been removed from the dataset.  

### 2.7 Detect outliers in the data
From the statistics (boxplots and ggplots) used to detect outliers, it was observed that there are a few cases in which outliers seem to exist.

**Outliers within the variable "num_host_listings"**  
From the boxplot it is observed that there are cases for which the number of listings the host has lies above 600. This is remarkable as the mean lies approximately around 12 listings. From further analysis, by filtering on "num_host_listings" above 600, it is observed that 1390 observations have a higher number of listings than 600. The data indicates that it is about observations of which multiple have the same id, but relate to another quarter. Besides that, from the data can be derived that these possible outliers mostly relate to the room type 'Entire home/apt'.  

**Outliers within the variable "price"**  
The boxplot shows that there are some cases for which the price is above 10,000 dollar. From further analysis, by filtering on "price" above 10,000, it is observed that 43 observations have a price higher than 10,000. The data indicates that it is about observations of which multiple have the same id, but relate to another quarter. Besides that, from the data can be derived that these possible outliers mostly pertain to the room type 'Entire home/apt' and are all located in London.  

However, the numbers of 'possible' outliers is in perspective of the total number of observations really small and will therefore not have any major impact on future analyses. 


## 3. After cleaning
The cleaned dataset (data_airbnb_uk_cleaned) contains 54,772 observations and 11 variables to work with. The cleaned dataset contains information on three different cities and in total 105 different neighbourhoods.