#!/bin/bash

# гасим бд
docker-compose down


# build a docker image 
docker build -t rgru/image-resizer:latest -f Dockerfile-frontend . 

# push the docker image 
docker login
docker push rgru/image-resizer:latest


# копируем docker-compose-frontend.yml и 
mkdir -p ../image-resizer-front
cp docker-compose-frontend.yml ../image-resizer-front/docker-compose.yml
