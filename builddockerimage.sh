parent_dir=${2}
${parent_dir}/bashtowriteDockerfile.sh
echo "  "
command=""
for x in ${parent_dir}/*.json ;
do 
	command="${command}   ${x}  "
done
echo $command
python /media/atul/WDJan2022/WASHU_WORKS/PROJECTS/FROM_DOCUMENTS/docker-images/command2label.py  $command  >> ./Dockerfile
imagename=$1

docker build -t sharmaatul11/${imagename} ${parent_dir}
docker push sharmaatul11/${imagename}

docker build -t registry.nrg.wustl.edu/docker/nrg-repo/sharmaatul11/${imagename} ${parent_dir}
docker push registry.nrg.wustl.edu/docker/nrg-repo/sharmaatul11/${imagename}
