#!/bin/bash



# гасим бд
docker-compose down

# удаляем файлы кэша
sudo rm -rf cache
