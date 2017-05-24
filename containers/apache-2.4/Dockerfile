FROM debian:latest

MAINTAINER delda <info@davidedellerba.it>

ENV GOSU_VERSION 1.10
RUN set -ex; \
	\
	fetchDeps=' \
		ca-certificates \
		wget \
	'; \
	apt-get update; \
	apt-get install -y --no-install-recommends $fetchDeps; \
	rm -rf /var/lib/apt/lists/*; \
	\
	dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
	wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
	\
# verify the signature
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
	gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
	rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc; \
	\
	chmod +x /usr/local/bin/gosu; \
# verify that the binary works
	gosu nobody true; \
	\
	apt-get purge -y --auto-remove $fetchDeps

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
COPY ./script/docker-entrypoint.sh /
RUN /docker-entrypoint.sh

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]


