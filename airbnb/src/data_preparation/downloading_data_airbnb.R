# title: "Download data Airbnb - United Kingdom"
# authors: "Team 2: Sanne van Ettinger, Claudia Berkhof, Demi van de Pol, Jurg Jacobs, Rob van der Wielen"

# Install R-packages
install.packages("agricolae")
install.packages("car")
install.packages("caret")
install.packages("data.table")
install.packages("dint")
install.packages("dplyr")
install.packages("effectsize")
install.packages("emmeans")
install.packages("ggplot2")
install.packages("googledrive")
install.packages("plyr")
install.packages("R.utils")
install.packages("readr")
install.packages("summarytools")
install.packages("tidyverse")
install.packages("zoo")

# Loading packages
library(plyr)
library(dplyr)
library(tidyverse)
library(readr)
library(googledrive)
library(data.table)
library(R.utils)

# Downloading the data from insideairbnb.com via Google Drive 
data_id <- "1AzdybwMX-2QRfcolBv-2xT-5XKUeQpRhLBXtH1n47qM"  
dir.create("../../data/")
drive_download(as_id(data_id), path = "../../data/listings_uk.csv", overwrite = TRUE)
df_drive <- read.csv("../../data/listings_uk.csv")

urls <- as.character(df_drive$link)

listings_uk <- lapply(urls, function(url) {
  print(paste0("Now downloading ... ", url))
  city = tolower(as.character(df_drive$city[match(url, df_drive$link)]))
  
  res = fread(url)
  res$city <- city
  return(res)
})

# Merging the datasets into one dataset
data_airbnb_uk = do.call('rbind', listings_uk)


# Exporting the raw data file (data_airbnb_uk) to a CSV file
fwrite(data_airbnb_uk, '../../data/data_airbnb_uk.csv', row.names = F)


















