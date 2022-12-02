#!/bin/bash 

#SESSION_ID=${1}
#XNAT_USER=${2}
#XNAT_PASS=${3}
#TYPE_OF_PROGRAM=${4}
#INPUTFILENAME=${1}
OUTPUTDIRNAME=/workingoutput #${2}
##############################LUNG SEGMENTATION ##########################################
#for INPUTFILENAME in /workinginput/*.nii* ;
#do
#python3 /software/lungsegmentation_module.py ${INPUTFILENAME} ${OUTPUTDIRNAME}
#done
#################################### VESSEL SEGMENTATION ###############################################
#for INPUTFILENAME in /workinginput/*.nii* ;
#do
#python3 /software/vessel_segmentation_module.py ${INPUTFILENAME} ${OUTPUTDIRNAME}
#done
CALCULATION_DIR=/calculation
LATEX_DIR=/latex
IMAGES_DIR=/images
for INPUTFILENAME in /workinginput/*.nii* ;
do
python3  /software/atelectatis_perc_cal_module.py ${INPUTFILENAME} ${OUTPUTDIRNAME} ${IMAGES_DIR} ${CALCULATION_DIR} ${LATEX_DIR}
done