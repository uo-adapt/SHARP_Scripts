#!/bin/bash
#$ -V
#$ -t 1-3

module load singularity
module load afni
module load ants
module load fsl
module load perl
module load R
module load python3


# Adjust these so they work on your system
SIMG=/projects/adapt_lab/shared/containers/xcpEngine.simg
FULL_COHORT=/projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine/anat_cohort.csv

# Create a temp cohort file with 1 line
HEADER=id0,id1,img
LINE_NUM=1
LINE=
TEMP_COHORT=/projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine/anat_cohort.csv..csv
echo  > 
echo  >> 

cd /projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine

bash xcpEngine -d /projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine/anat-Complete+_201901151515.dsn 	-c /projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine${TEMP_COHORT} \
	-o /projects/adapt_lab/shared/SHARP/bids_data/derivatives/xcpEngine/data 	-t 1 	-i $TMPDIR

