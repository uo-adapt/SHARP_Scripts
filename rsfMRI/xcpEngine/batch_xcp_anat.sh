#/bin/bash
#
# This batch file calls on your subject
# list (named subject_list.txt). And 
# runs the job_fmriprep.sh file for 
# each subject. It saves the ouput
# and error files in their specified
# directories.
#
# Set your directories

group_dir=/projects/adapt_lab/shared/
#container=BIDS/SingularityContainers/poldracklab_fmriprep_latest-2017-07-20-dd77d76c5e14.img
container=containers/fmriprep-1.2.4.simg
study="SHARP"


sbatch --export ALL,subid=${SUBJ} --job-name xcpAnat --partition=long --mem=100G -o "${group_dir}"/"${study}"/SHARP_Scripts/rsfMRI/xcpEngine/output/xcp_anat_output.txt -e "${group_dir}"/"${study}"/SHARP_Scripts/rsfMRI/xcpEngine/output/xcp_anat_error.txt xcp_anat.sh