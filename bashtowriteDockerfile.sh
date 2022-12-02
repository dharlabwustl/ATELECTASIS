#!/bin/bash
#echo 'FROM sharmaatul11/rapidsai1keras:latest' > Dockerfile
echo 'FROM nvcr.io/nvidia/rapidsai/rapidsai-core:22.10-cuda11.2-base-ubuntu20.04-py3.9 ' > Dockerfile
#echo 'FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04 ' > Dockerfile
echo 'RUN apt-get update ' >> Dockerfile
#echo 'RUN apt-get install -y python3 pip git vim' >> Dockerfile
echo 'RUN apt-get install -y git vim' >> Dockerfile
#     RUN apt-get install ffmpeg libsm6 libxext6  -y
echo 'RUN apt-get install ffmpeg libsm6 libxext6  -y ' >> Dockerfile

#echo 'FROM pytorch/pytorch:1.13.0-cuda11.6-cudnn8-runtime ' > Dockerfile
echo 'RUN mkdir -p /callfromgithub ' >> Dockerfile
echo 'RUN chmod 755 /callfromgithub ' >> Dockerfile
echo 'COPY downloadcodefromgithub.sh /callfromgithub/ ' >> Dockerfile
echo 'RUN chmod +x  /callfromgithub/downloadcodefromgithub.sh ' >> Dockerfile

#echo 'RUN pip install  torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116 ' >> Dockerfile
echo 'RUN /opt/conda/bin/pip install nibabel simpleitk  tensorflow-gpu wandb xlsxwriter natsort vtk itk numpy ' >> Dockerfile
echo 'RUN  /opt/conda/envs/rapids/bin/pip install nibabel opencv-python lungmask' >> Dockerfile
echo 'RUN /opt/conda/bin/pip install opencv-python scikit-image pandas Jinja2'  >> Dockerfile
#echo ' RUN conda install -n rapids -c menpo opencv ' >> Dockerfile
#echo 'RUN /opt/conda/bin/pip install  torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116 ' >> Dockerfile
#echo 'RUN /opt/conda/bin/pip install opencv-python pandas lungmask numba niwidgets' >> Dockerfile
#echo 'RUN pip install nibabel SimpleITK  tensorflow-gpu wandb xlsxwriter natsort vtk itk numpy ' >> Dockerfile

#echo 'RUN pip install opencv-python pandas lungmask numba ' >> Dockerfile
#/opt/conda/envs/rapids/bin/python niwidgets
#echo 'RUN apt install -y vim ' >> Dockerfile
#simpleitk -c pytorch \
#tensorflow-gpu \
#keras-gpu \
##    simpleitk \
##    vtk \
##    itk \
#   wandb \
#xlsxwriter \
#natsort
