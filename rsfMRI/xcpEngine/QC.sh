#!/bin/bash
#
XCPEDIR=/projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine
outputdir=/projects/adapt_lab/shared/SHARP/bids_data/derivatives/xcpEngine/data

${XCPEDIR}/utils/combineOutput \
	-p $outputdir \
	-f "*quality.csv" \
	-o XCP_QAVARS.csv

