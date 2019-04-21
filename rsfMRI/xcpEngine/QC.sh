#!/bin/bash
#
XCPEDIR=/projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine
outputdir=/projects/adapt_lab/shared/data/BIDS_data/derivatives/xcpEngine/data

${XCPEDIR}/utils/combineOutput \
-p $outputdir  \  # all subjects directory  after running xcpEngine
-f "*quality.csv" \  # the extention of the file users want to combine
-o XCP_QAVARS.csv  # the output file in csv

