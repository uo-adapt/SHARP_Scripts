#!/bin/bash
FULL_COHORT=/projects/adapt_lab/shared/SHARP/SHARP_Scripts/rsfMRI/xcpEngine/anat_cohort.csv
NJOBS=`wc -l < ${FULL_COHORT}`

if [[ ${NJOBS} == 0 ]]; then
    exit 0
fi

cat << EOF > xcpParallel.sh
#$ -V
#$ -t 1-${NJOBS}

module load singularity

# Adjust these so they work on your system
SIMG=/projects/adapt_lab/shared/containers/xcpEngine.simg
FULL_COHORT=${FULL_COHORT}

# Create a temp cohort file with 1 line
HEADER=\$(head -n 1 \$FULL_COHORT)
LINE_NUM=\$( expr \$SGE_TASK_ID + 1 )
LINE=\$(awk "NR==\$LINE_NUM" \$FULL_COHORT)
TEMP_COHORT=\${FULL_COHORT}.\${SGE_TASK_ID}.csv
echo \$HEADER > \$TEMP_COHORT
echo \$LINE >> \$TEMP_COHORT

singularity run -B /data:/home/user/data \$SIMG \\
  -c /home/user\${TEMP_COHORT} \\
  -d /home/user/data/study/my_design.dsn \\
  -o /home/user/data/study/output \\
  -i \$TMPDIR

EOF
qsub xcpParallel.sh