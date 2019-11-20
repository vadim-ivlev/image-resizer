#!/bin/bash

echo 'building frontend container'

sh/build-deploy-directory.sh || exit 1
cd deploy

echo 'building an image'

docker build -t vadimivlev/image-resizer:latest . || exit 2

echo 'pushing the image hub.docker.com' 

docker login
docker push vadimivlev/image-resizer:latest
