# image-resizer

**Сервис масштабирования изображений.**


**Мотивация**

Часто на HTML страницах нужна уменьшенная или обрезанная версия изображения. Передача файла целиком тратит ресурсы сервера, клиента и канала связи. 

##  image-resizer

решает проблему, изменяя изображение на сервере. Пусть исходное изображение хранится по URI

- /some/path/image.jpg

    
Для получения **масштабированного** изображения с шириной 320 и высотой 150 пикселей, нужно выполнить запрос

- /`resize320x240`/some/path/image.jpg

Для получения **обрезанного** изображения с размерами 320 на 150 пикселей

- /`crop320x240`/some/path/image.jpg


Сервер изменяет изображение и возвращает уменьшенную копию клиенту.

Чтобы не перегружать процессор сервера повторной обработкой изображений, измененные копии изображений сохраняются в кэше сервера. В следующий раз, при том же запросе сервер возвратит изображение из кэша. 

Р И С У Н О К



## Использование с file-uploader

`image-resizer` можно использовать с сервисом загрузки файлов `file-uploader`. В таком случае папка, куда `file-uploader` загружает файлы и папка, откуда `image-resizer` берет изображения, могут совпадать.


Р И С У Н О К


## Изменения размеров

Масштабирование  `resize320x150`

Р И С У Н О К

Обрезка `crop320x150`

Р И С У Н О К

Для пропорционального изменения размеров вместо числа можно вставить "-", .


## Настройки

- Папка с исходными изображениями (или url).  Файл `docker-compose.yml` строки: 

        volumes:
        #  Место для хранения изображений
        - ./directory_for_images:/images

- Папка кэша.  Файл `docker-compose.yml` строки: 

        volumes:
            ...
            - ./cache_directory/:/cache/
            ...

    Папку кэша можно закомментировать в `docker-compose.yml`. В этом случае кэш будет исчезать при перезапуске контейнеров.

- Время жизни уменьшенных изображений в кэше. Файл `configs/image-resizer-default.conf` строки: 

        proxy_cache_valid  200      24h;


- Размер кэша. Если место для хранения уменьшенных изображений заканчивается, приложение удаляет самые старые файлы освобождая место для новых. Файл `configs/image-resizer-default.conf` строки: 

        proxy_cache_path /cache 
                ...
                max_size=5G 
                ...



## Проверки

Если под следующими ссылками видны изображения сервис доступен.

- Исходное изображение <http://image-resizer.rg.ru/2019/10/03/30830/dont.jpg>

<img src="http://image-resizer.rg.ru/2019/10/03/30830/dont.jpg">

- Масштабированное 320x200  <http://image-resizer.rg.ru/resize320x200/2019/10/03/30830/dont.jpg>

<img src="http://image-resizer.rg.ru/resize320x200/2019/10/03/30830/dont.jpg" >

- Обрезанное 320x200 <http://image-resizer.rg.ru/crop320x200/2019/10/03/30830/dont.jpg>

<img src="http://image-resizer.rg.ru/crop320x200/2019/10/03/30830/dont.jpg" >

<!-- ## Нагрузочное тестирование -->

------------------------------- 

#  Для разработчиков

- Запуск `sh/up.sh`
- Останов `sh/down`
- Рестарт `sh/restart.sh`  

Порядок работы

- Внести изменения
- `sh/push.sh`
- `sh/deploy.sh`


