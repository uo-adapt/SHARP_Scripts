# This script wil take a list made from the lcni directory
# and will strip the excess leaving all the names
import os

# Set study info (may need to change for your study)
# These variables are used only in this file for paths. Can omit if wanted.
group = "adapt_lab"
study = "SHARP"
PI = "Allen"
scriptsFolder = "SHARP_Scripts"

# The following variables are used in the main script and need to be defined here. 
# They need to exist prior to running the script

# Directories
parentdir = os.path.join(os.sep, "projects", group, "shared", study) 
codedir = os.path.join(parentdir, scriptsFolder, "rsfMRI", "xcpEngine") 
fmriprepdir = os.path.join(parentdir,"bids_data","derivatives","fmriprep")


# Change this to either be anatomical (anat) or functional (rest)
preproc= "anat"

subjectdir_contents = os.listdir(fmriprepdir)

subjectdir_contents = list(filter(lambda k: 'sub-' in k, subjectdir_contents))
subjectdir_contents = [x for x in subjectdir_contents if not '.html' in x]
subjectdir_contents.sort()



with open(os.path.join(codedir,"anat_cohort.csv"), mode="w") as outfile:  # also, tried mode="rb"
    for subject in subjectdir_contents:
        outfile.write("%s\n" % subject)




