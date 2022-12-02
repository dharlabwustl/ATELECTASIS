FROM nvcr.io/nvidia/rapidsai/rapidsai-core:22.10-cuda11.2-base-ubuntu20.04-py3.9 
RUN apt-get update 
RUN apt-get install -y git vim 
RUN apt-get install ffmpeg libsm6 libxext6  -y 
RUN mkdir -p /callfromgithub 
RUN chmod 755 /callfromgithub 
COPY downloadcodefromgithub.sh /callfromgithub/ 
RUN chmod +x  /callfromgithub/downloadcodefromgithub.sh 
RUN /opt/conda/bin/pip install nibabel simpleitk  tensorflow-gpu wandb xlsxwriter natsort vtk itk numpy 
RUN  /opt/conda/envs/rapids/bin/pip install nibabel opencv-python lungmask
RUN /opt/conda/bin/pip install opencv-python scikit-image pandas Jinja2
RUN apt-get install -y  texlive-latex-extra 
