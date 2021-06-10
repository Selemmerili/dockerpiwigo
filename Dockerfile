FROM php:7.3-apache

COPY piwigo/ /var/www/html

WORKDIR /var/www/html/

RUN apt-get update && apt-get upgrade -y

RUN docker-php-ext-install mysqli

RUN apt-get install -y curl
RUN apt-get install -y build-essential libssl-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

#RUN chmod 777 _data

EXPOSE 80

# (PAS TRES SECURISE)
RUN chmod 777 -R /var/www/html/

# RUN docker-php-ext-install gd

RUN apache2ctl restart



# RUN sed 's/# The directory where shm and other runtime files will be stored./ServerName localhost/' /etc/apache2/apache2.conf

# RUN apache2ctl restart