#!/bin/bash
echo 'FROM nvcr.io/nvidia/rapidsai/rapidsai-core:22.10-cuda11.2-base-ubuntu20.04-py3.9 ' > Dockerfile
#echo 'FROM sharmaatul11/rapidsai1keras:latest' > Dockerfile
#echo 'FROM pytorch/pytorch:1.13.0-cuda11.6-cudnn8-runtime ' > Dockerfile
echo 'RUN mkdir -p /callfromgithub ' >> Dockerfile
echo 'RUN chmod 755 /callfromgithub ' >> Dockerfile
echo 'COPY downloadcodefromgithub.sh /callfromgithub/ ' >> Dockerfile
echo 'RUN chmod +x  /callfromgithub/downloadcodefromgithub.sh ' >> Dockerfile
echo 'RUN /opt/conda/bin/pip install simpleitk  tensorflow-gpu wandb xlsxwriter natsort vtk itk numpy ' >> Dockerfile
echo 'RUN /opt/conda/bin/pip install  torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116 ' >> Dockerfile
#/opt/conda/envs/rapids/bin/python
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
