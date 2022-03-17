PREPARATION = airbnb/src/data_preparation
ANALYSIS = airbnb/src/analysis

## Main project pipeline

all: analysis data-preparation

data-preparation:
	make -C $(PREPARATION)

analysis: data-preparation
	make -C $(ANALYSIS)
