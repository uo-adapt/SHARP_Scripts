#!/bin/bash
#

module load singularity
module load afni
module load ants
module load fsl
module load c3d
module load R
module load python3

cd /projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine

bash xcpEngine -d /projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine/anat-Complete+_201901151515.dsn \
	-c "${TEMP_COHORT}",${ses} \
	-o /projects/adapt_lab/shared/SHARP/bids_data/derivatives/xcpEngine/data \
	-t 2 \
	-r /projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine \
	-i \$TMPDIR

rm "${TEMP_COHORT}",${ses}