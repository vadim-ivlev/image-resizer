#!/bin/bash

# гасим 
docker-compose down

# удаляем кэш
sudo rm -rf cache

# поднимаем 
docker-compose up -d

# поясняем
sh/greetings.sh