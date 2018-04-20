FROM ubuntu:14.04
RUN apt-get update
RUN apt-get -y install git nginx-full php5-fpm curl
ADD https://s3.amazonaws.com/gitlist/gitlist-0.5.0.tar.gz /var/www/
RUN cd /var/www; tar -zxvf gitlist-0.5.0.tar.gz
RUN chmod -R 777 /var/www/gitlist
RUN cd /var/www/gitlist/; mkdir cache; chmod 777 cache
WORKDIR /var/www/gitlist/
ADD config.ini /var/www/gitlist/
ADD nginx.conf /etc/

CMD service php5-fpm restart; nginx -c /etc/nginx.conf


