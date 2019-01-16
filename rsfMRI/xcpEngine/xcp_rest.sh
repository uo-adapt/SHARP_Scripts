#!/bin/bash
#

module load singularity
module load afni
module load ants
module load fsl
module load prl
module load R
module load python3

cd /projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine

bash xcpEngine -d /projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine/fc-ICA-AROMA+GSR_201901161332.dsn \
	-c /projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine/rest_cohort.csv \
	-o /projects/adapt_lab/shared/SHARP/bids_data/derivatives/xcpEngine/data \
	-t 3 \
	-r /projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine
