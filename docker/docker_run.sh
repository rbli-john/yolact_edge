#!/bin/bash
   
container_name=rbli_yolact_edge
image_name=rbli_yolact_edge_image

docker stop ${container_name}
docker rm ${container_name}

nvidia-docker run --gpus all -it --name=${container_name} \
  --shm-size=8gb --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  -u $(id -u):$(id -g) \
  -v $HOME/:$HOME/:rw \
  -v /nfs/AI/SegDepth/:/nfs/AI/SegDepth/:rw \
  ${image_name}
