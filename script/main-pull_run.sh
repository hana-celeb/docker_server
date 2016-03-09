#!/bin/sh

docker_path="/usr/bin/docker"
container_name="hana-celeb-main"
host_port=80
container_port=80
docker_hub_latest="hanaceleb/webapp:latest"
docker_hub_backup="hanaceleb/webapp:backup"

sudo ${docker_path} tag ${docker_hub_latest} ${docker_hub_backup}

sudo ${docker_path} pull ${docker_hub_latest}
result_code=$?
if [ ${result_code} -ne 0 ]
then
  exit 1;
fi

sudo docker stop ${container_name}
sudo docker rm ${container_name}
#if [ ${result_code} -ne 0 ]
#then
#  exit 2;
#fi

sudo ${docker_path} run -d -p ${host_port}:${container_port} --name ${container_name} ${docker_hub_latest}
result_code=$?
if [ ${result_code} -ne 0 ]
then
  exit 3;
fi

exit 0;
