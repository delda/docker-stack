FROM debian:latest

MAINTAINER delda <info@davidedellerba.it>

RUN echo "deb http://ftp.es.debian.org/debian stable main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://ftp.es.debian.org/debian stable main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://ftp.debian.org/debian/ wheezy-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://ftp.debian.org/debian/ wheezy-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y apache2 && \
    a2enmod rewrite && \
    a2enmod proxy_fcgi

ADD virtual-host.conf /etc/apache2/sites-available/000-default.conf
COPY script/docker-entrypoint.sh /
ENTRYPOINT ["/bin/bash", "-c", "/docker-entrypoint.sh"]