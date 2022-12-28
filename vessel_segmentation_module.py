#!/usr/bin/env python


import itk
import vtk
import numpy as np
import sys,os,glob,subprocess
output_directory=sys.argv[2] #os.path.join(directory_name,'vessel_output_directory') ###'filter_output_directory')

atelectasis_percentage_list=[]
INPUT=sys.argv[1]
current_file_noext= os.path.basename(INPUT).split('.nii')[0]
print('current_file_noext')
print(current_file_noext)

I_file=INPUT #'/media/atul/AC0095E80095BA32/WASHU_WORK/PROJECTS/LUNGS/DATA/FromPorche/Lungs/AHB1235/AHB1235_20200228084958_C_A_P_+cm_2.5_B20s.nii.gz'
print(I_file)
image = itk.imread(I_file,itk.ctype("float"))
# for sigma in range(1,4):
#     image = itk.imread(I_file,itk.ctype("float"))
#     hessian_image = itk.hessian_recursive_gaussian_image_filter(image, sigma=sigma)
#     vesselness_filter = itk.Hessian3DToVesselnessMeasureImageFilter[itk.ctype("float")].New()
#     vesselness_filter.SetInput(hessian_image)
#     for alpha1 in range(5,11,5):
#         vesselness_filter.SetAlpha1(alpha1/10)
#         for alpha2 in range(15,31,5):
#             vesselness_filter.SetAlpha2(alpha2/10)
#             output_filename=os.path.join(output_directory,os.path.basename(INPUT).split(".nii")[0] + "_" +str(sigma) +"_" +str(alpha1) +"_" + str(alpha2) +'_vessels.nii.gz')
#             print(output_filename)
#             itk.imwrite(vesselness_filter, output_filename)
sigma=2
alpha1=5
alpha2=15
# image = itk.imread(I_file,itk.ctype("float"))
hessian_image = itk.hessian_recursive_gaussian_image_filter(image, sigma=sigma)
vesselness_filter = itk.Hessian3DToVesselnessMeasureImageFilter[itk.ctype("float")].New()
vesselness_filter.SetInput(hessian_image)
vesselness_filter.SetAlpha1(alpha1/10)
vesselness_filter.SetAlpha2(alpha2/10)
output_filename=os.path.join(output_directory,os.path.basename(INPUT).split(".nii")[0] + "_" +str(sigma) +"_" +str(alpha1) +"_" + str(alpha2) +'_vessels.nii.gz')
print(output_filename)
itk.imwrite(vesselness_filter, output_filename)






