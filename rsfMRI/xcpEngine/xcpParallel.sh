#!/bin/bash
#$ -V
#$ -t 1-3

#SBATCH --partition=long        ### Partition (like a queue in PBS)
#SBATCH --job-name=xcpAnat      ### Job Name
#SBATCH --nodes=1               ### Number of nodes needed for the job


module load singularity
module load afni
module load ants
module load fsl
module load perl
module load c3d
module load R
module load python3


# Adjust these so they work on your system
SIMG=/projects/adapt_lab/shared/containers/xcpEngine.simg
FULL_COHORT=/projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine/anat_cohort.csv

# Create a temp cohort file with 1 line
HEADER=$(head -n 1 $FULL_COHORT)
LINE_NUM=$( expr $SGE_TASK_ID + 1 )
LINE=$(awk "NR==$LINE_NUM" $FULL_COHORT)
TEMP_COHORT=${FULL_COHORT}.${SGE_TASK_ID}.csv
echo $HEADER > $TEMP_COHORT
echo $LINE >> $TEMP_COHORT

singularity run -B /projects/adapt_lab/shared/SHARP/bids_data/derivatives/xcpEngine/data:/projects/adapt_lab/shared/SHARP/bids_data/derivatives/xcpEngine/data $SIMG \
  -c /projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine${TEMP_COHORT} \
  -d /projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine/anat-Complete+_201901151515.dsn \
  -o /projects/adapt_lab/shared/SHARP/bids_data/derivatives/xcpEngine/data \
  -i $TMPDIR

