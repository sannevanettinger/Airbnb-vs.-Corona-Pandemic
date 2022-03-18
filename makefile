PREPARATION = airbnb/src/data_preparation
ANALYSIS = airbnb/src/analysis
DATA = airbnb/data
INPUT = airbnb/gen/analysis/input
OUTPUT = airbnb/gen/analysis/output
TEMP = airbnb/gen/analysis/temp


## Main project pipeline

all: analysis data-preparation clean

data-preparation:
	make -C $(PREPARATION)

analysis: data-preparation
	make -C $(ANALYSIS)

clean:
	-rm -r $(DATA)
	-rm -r $(INPUT)
	-rm -r $(OUTPUT)
	-rm -r $(TEMP)
