#!/bin/bash
#
XCPEDIR=/projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine
outputdir=/projects/adapt_lab/shared/SHARP/bids_data/derivatives/xcpEngine/data

${XCPEDIR}/utils/combineOutput \
	-p $outputdir \
	-f "*_ts.1D" \
	-o XCP_FCON.csv
