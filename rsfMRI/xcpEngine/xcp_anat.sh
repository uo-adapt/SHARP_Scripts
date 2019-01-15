#!/bin/bash
#

module load singularity

HOME=/projects/adapt_lab/shared/SHARP/bids_data/derivatives/

singularity run -B ${DATA_ROOT}:${HOME}xcpEngine  \
   /projects/adapt_lab/shared/containers/xcpEngine.simg
   -d ${HOME}xcpEngine.simg/anat-antsct.dsn \
   -c ${HOME}xcpEngine/anat_cohort.csv  \
   -o ${HOME}xcpEngine/xcp_output \
   -t 1 \
   -r ${HOME}/xcpEngine