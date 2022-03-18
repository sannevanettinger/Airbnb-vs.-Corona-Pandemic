INPUT = ../../gen/analysis/input
TEMP = ../../gen/analysis/temp
ANALYSIS = ../../src/analysis

all: $(TEMP)/analysis.log

## sub-rules

$(TEMP)/analysis.log: $(ANALYSIS)/analysis_data_airbnb.R $(INPUT)/data_airbnb_uk_cleaned.csv
	R --vanilla < $(ANALYSIS)/analysis_data_airbnb.R
	

