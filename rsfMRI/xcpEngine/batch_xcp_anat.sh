#!/bin/bash

group_dir=/projects/adapt_lab/shared/
study="SHARP"

FULL_COHORT=/projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine/anat_cohort.csv

readarray SUBJLIST < anat_cohort.csv


for SUBJ in $(seq 1 $(cat anat_cohort.csv | wc -l)); do

# Create a temp cohort file with 1 line

ID=${SUBJLIST[SUBJ]%%,/*}
HEADER=$(head -n 1 $FULL_COHORT)
LINE=$(awk "NR==$SUBJ" $FULL_COHORT)
TEMP_COHORT=${FULL_COHORT}.${ID}.csv
echo $HEADER > $TEMP_COHORT
echo $LINE >> $TEMP_COHORT

sbatch --export ALL,ID=${ID},TEMP_COHORT=${TEMP_COHORT} --job-name xcp_anat_"${ID}" --partition=short --time=02:00:00 --mem=10G -o "${group_dir}"/"${study}"/SHARP_Scripts/xcpEngine/output/"${ID}"_xcp_anat_output.txt -e "${group_dir}"/"${study}"/SHARP_Scripts/xcpEngine/output/"${ID}"_xcp_anat_error.txt xcp_anat.sh


done
