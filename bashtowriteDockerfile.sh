#!/bin/bash
echo 'FROM sharmaatul11/rapidsai1keras:latest' > Dockerfile
echo 'RUN mkdir -p /callfromgithub ' >> Dockerfile
echo 'RUN chmod 755 /callfromgithub ' >> Dockerfile
echo 'COPY downloadcodefromgithub.sh /callfromgithub/ ' >> Dockerfile
echo 'RUN chmod +x  /callfromgithub/downloadcodefromgithub.sh ' >> Dockerfile
echo 'RUN /opt/conda/bin/pip install vtk itk numpy ' >> Dockerfile
echo 'RUN apt install -y nano ' >> Dockerfile
'

