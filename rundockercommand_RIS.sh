# docker build -t sharmaatul11/yashengcsfinfarctseg1 .
# docker push  sharmaatul11/yashengcsfinfarctseg1 
# docker run -v $workinginput:/workinginput -v $workingoutput:/workingoutput -v $ZIPFILEDIR:/ZIPFILEDIR -v$output:/output  -it sharmaatul11/yashengcsfinfarctseg1  /Stroke_CT_Processing/call_preproc_segm_session_level_1.sh SNIPR_E03523 
# docker build -t sharmaatul11/dicom2nifti_nwu_1 .
imagename=atelectasissegmentation1:newrapids
#./builddockerimage.sh ${imagename}
prefix_dir=/media/atul/WDJan2022/WASHU_WORKS/PROJECTS/DOCKERIZE/LUNGS/PYCHARM/ARCHIVE
workinginput=$prefix_dir/workinginput
workingoutput=$prefix_dir/workingoutput
ZIPFILEDIR=$prefix_dir/ZIPFILEDIR
outputinsidedocker=$prefix_dir/outputinsidedocker
software=$prefix_dir/software
calculation=$prefix_dir/calculation
latex=$prefix_dir/latex
images=$prefix_dir/images

mkdir $workingoutput
mkdir $workinginput
mkdir $ZIPFILEDIR
mkdir $outputinsidedocker
mkdir $software
mkdir $calculation
mkdir $latex
mkdir $images
sessionID=SNIPR_E03614 #SNIPR_E03516
#rm -r $workingoutput/*
#rm -r $ZIPFILEDIR/*
#rm -r $outputinsidedocker/*
#rm -r $software/*
#rm -r $calculation/*
#rm -r $images/*
#rm -r $latex/*
export LSF_DOCKER_VOLUMES=" $images:/images  $latex:/latex $calculation:/calculation  $software:/software $software:/software  $workinginput:/workinginput  $workingoutput:/workingoutput  $ZIPFILEDIR:/ZIPFILEDIR  $outputinsidedocker:/outputinsidedocker "
bsub -Is -q general-interactive -M 16GB -R "rusage[mem=16GB]"  -G compute-dharr -a 'docker(sharmaatul11/'${imagename}':latest)'  /callfromgithub/downloadcodefromgithub.sh https://github.com/dharlabwustl/ATELECTASIS.git