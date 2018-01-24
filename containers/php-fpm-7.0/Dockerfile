FROM debian:jessie

MAINTAINER delda <info@davidedellerba.it>

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y install wget vim && \
    echo "deb http://packages.dotdeb.org jessie all" > /etc/apt/sources.list.d/dotdeb.list && \
    wget -qO - https://www.dotdeb.org/dotdeb.gpg | apt-key add - && \
    apt-get update && \
    apt-get -y install php7.0-fpm php7.0-cli php7.0-xml && \
    chown www-data:www-data /run/php

# increase performance
RUN sed 's/listen = .*/listen = 10.10.10.20:9000/g'  -i /etc/php/7.0/fpm/pool.d/www.conf && \
    sed 's/display_errors = Off/display_errors = On/g' -i /etc/php/7.0/fpm/php.ini

# start php7.0-fpm
CMD ["php-fpm7.0", "--nodaemonize", "--fpm-config", "/etc/php/7.0/fpm/php-fpm.conf"]