# docker build -t sharmaatul11/yashengcsfinfarctseg1 .
# docker push  sharmaatul11/yashengcsfinfarctseg1 
# docker run -v $PWD/workinginput:/workinginput -v $PWD/workingoutput:/workingoutput -v $PWD/ZIPFILEDIR:/ZIPFILEDIR -v$PWD/output:/output  -it sharmaatul11/yashengcsfinfarctseg1  /Stroke_CT_Processing/call_preproc_segm_session_level_1.sh SNIPR_E03523 
# docker build -t sharmaatul11/dicom2nifti_nwu_1 .
imagename=atelectasissegmentation
#./builddockerimage.sh ${imagename}
data_directory=""
cd data_directory
mkdir workingoutput
mkdir workinginput
mkdir ZIPFILEDIR
mkdir outputinsidedocker
mkdir software
mkdir calculation
sessionID=SNIPR_E03614 #SNIPR_E03516
cp ${data_directory}/*.nii*  /workinginput/
#rm -r workingoutput/*
#rm -r ZIPFILEDIR/*
#rm -r outputinsidedocker/*
rm -r software/* #$HOME:$HOME  /storage1/fs1/dharr/Active:/storage1/fs1/dharr/Active
export LSF_DOCKER_VOLUMES="$PWD/software:/software  $PWD/workinginput:/workinginput  $PWD/workingoutput:/workingoutput  $PWD/ZIPFILEDIR:/ZIPFILEDIR  $PWD/outputinsidedocker:/outputinsidedocker "
bsub -Is -q general-interactive -M 16GB -R "rusage[mem=16GB]"  -G compute-dharr -a 'docker(sharmaatul11/'${imagename}':latest)'  /callfromgithub/downloadcodefromgithub.sh https://github.com/dharlabwustl/ATELECTASIS.git