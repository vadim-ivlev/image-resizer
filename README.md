# image-resizer
## Resize and Crop images

### Сервис масштабирования изображений.
масштабирует и обрезает изображения по требованию клиентского приложения.


## Мотивация

Часто на HTML страницах требуется разместить уменьшенную или обрезанную версию изображения. Передача файла целиком тратит ресурсы сервера, клиента и канала связи. 

##  image-resizer

image-resizer решает проблему, масштабируя изображение на сервере.

Пусть исходное изображение хранится по адресу

    http://image-resizer.rg.ru/some/path/image.jpg

    
Для получения изображение с размерами 320 на 240 пикселей, нужно выполнить запрос

    http://image-resizer.rg.ru/320x240/some/path/image.jpg

Сервер отмасштабирует изображение и возвратит его уменьшенную копию.

Чтобы не перегружать процессор сервера непрерывной обработкой изображений, уменьшенные копии изображений сохраняются в кэше сервера. В следующий раз, при том же запросе сервер возвратит изображение из кэша. 

Р И С У Н О К



# Использование с file-uploader

image-resizer удобно использовать совместно с сервисом загрузки файлов file-uploader. В таком случае папка, куда file-uploader загружает файлы и папка, откуда image-resizer берет изображения, могут совпадать.


Р И С У Н О К


# Настройки приложения

- Папка с исходными изображениями (или url)

- Время жизни уменьшенных изображений в кэше

- Размер кэша. Если место для хранения уменьшенных изображений заканчивается, приложение удаляет самые старые файлы освобождая место для новых.



 

#  Для разработчиков

Запуск

    docker-compose up -d


