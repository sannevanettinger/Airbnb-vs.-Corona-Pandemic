DATA = ../../data
PREPARATION = ../../src/data_preparation
INPUT = ../../gen/analysis/input

all: $(DATA)/listings_uk.csv $(DATA)/data_airbnb_uk.csv $(INPUT)/data_airbnb_uk_cleaned.csv

## sub-rules

$(DATA)/listings_uk.csv: $(PREPARATION)/downloading_data_airbnb.R
	R --vanilla < $(PREPARATION)/downloading_data_airbnb.R

$(DATA)/data_airbnb_uk.csv: $(PREPARATION)/downloading_data_airbnb.R $(DATA)/listings_uk.csv
	R --vanilla < $(PREPARATION)/downloading_data_airbnb.R

$(INPUT)/data_airbnb_uk_cleaned.csv: $(PREPARATION)/preparation_data_airbnb.Rmd $(DATA)/data_airbnb_uk.csv
	Rscript -e "rmarkdown::render('preparation_data_airbnb.Rmd')"
