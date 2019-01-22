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

bash xcpEngine -d /projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine/fc-ICA-AROMA_201901170904.dsn \
	-c "${TEMP_COHORT}",${ses},${run} \
	-o /projects/adapt_lab/shared/SHARP/bids_data/derivatives/xcpEngine/data \
	-t 1 \
	-i \$TMPDIR

rm "${TEMP_COHORT}",${ses},${run}
