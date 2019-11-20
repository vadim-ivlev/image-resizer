#!/bin/bash

echo 'building /deploy directory'

echo "чистим ./deploy/"

rm -rf deploy/configs_example

echo "копируем файлы в ./deploy/"

cp -r configs           deploy/configs_example

echo "осторожно копируем файлы в ./deploy/configs/ "

mkdir -p deploy/configs
cp -f configs/image-resizer-nginx.conf  deploy/configs/image-resizer-nginx.conf
cp -f configs/image-resizer-default.conf  deploy/configs/image-resizer-default.conf
