#!/bin/bash 

#SESSION_ID=${1}
#XNAT_USER=${2}
#XNAT_PASS=${3}
#TYPE_OF_PROGRAM=${4}
#INPUTFILENAME=${1}
OUTPUTDIRNAME=/workingoutput #${2}
###############################LUNG SEGMENTATION ##########################################
for INPUTFILENAME in /workinginput/*.nii* ;
do
/opt/conda/envs/rapids/bin/python /software/lungsegmentation_module.py ${INPUTFILENAME} ${OUTPUTDIRNAME}
done
#################################### VESSEL SEGMENTATION ###############################################
for INPUTFILENAME in /workinginput/*.nii* ;
do
/opt/conda/bin/python /software/vessel_segmentation_module.py ${INPUTFILENAME} ${OUTPUTDIRNAME}
done