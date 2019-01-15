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

singularity run /projects/adapt_lab/shared/containers/xcpEngine.simg \
	-d anat-Complete+_201901151515.dsn \
	-c anat_cohort.csv \
	-o /projects/adapt_lab/shared/SHARP/bids_data/derivatives/xcpEngine/data \
	-t 1 \
	-r /projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine
