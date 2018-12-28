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
dicomdir = os.path.join(os.sep, "projects", "lcni", "dcm", group, "Archive", "sharp")
parentdir = os.path.join(os.sep, "projects", group, "shared", study) # folder that contains bidsdir and codedir
codedir = os.path.join(parentdir, scriptsFolder, "org", "conversion") # Contains subject_list.txt, config file, and dcm2bids_batch.py

subjectdir_contents = os.listdir(dicomdir)
subjectdir_contents.sort()
subjectdir_contents = filter(lambda k: len(k) < 16, subjectdir_contents)
subjectdir_contents = list(filter(lambda k: 'SH' in k, subjectdir_contents))

subjectdir_contents = [subject + "," + subject for subject in subjectdir_contents]

for subject in range(len(subjectdir_contents)):
	subjectdir_contents[subject] = subjectdir_contents[subject][:-9]

subjectdir_contents = [subject + ",1" for subject in subjectdir_contents]

subjectdir_contents

with open(os.path.join(codedir,"subject_list.txt"), mode="w") as outfile:  # also, tried mode="rb"
    for subject in subjectdir_contents:
        outfile.write("%s\n" % subject)




