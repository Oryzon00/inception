FROM		debian:buster

RUN			apt update && apt upgrade -y &&	apt install -y	\
				wget			\
				php7.3			\
				php-fpm			\
				php-mysql		\
				mariadb-client

# Install with wget wordpress 6.1.1 into folder /var/www
RUN			mkdir -p /var/www/html/
RUN 		wget https://fr.wordpress.org/wordpress-6.1.1-fr_FR.tar.gz -P /var/www/html

# decompression et clean de wordpress
RUN 		cd /var/www/html; \
			tar -xzf wordpress-6.1.1-fr_FR.tar.gz; \ 
			rm wordpress-6.1.1-fr_FR.tar.gz

# droit root sur dossier wordpress
RUN			chown -R root:root /var/www/html/wordpress

# Fichier config php
COPY		conf/www.conf		/etc/php/7.3/fpm/pool.d

# Installe CLI set up config wordpress
RUN 		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN 		chmod +x wp-cli.phar
RUN 		mv wp-cli.phar /usr/local/bin/wp

# # Copy script to set up wordpress
# RUN 		mkdir -p /var/wwww/wordpress
COPY		/tools/auto_config.sh	/var/wordpress/auto_config.sh

# dodge error php
RUN			mkdir -p /run/php

EXPOSE		9000

# CMD: 			args in docker run OVERRIDE CMD
# ENTRYPOINT:	args in docker run ARE USED as args for ENTRYPOINT
# cases with CM et ENTRYPOINT en meme temps??
ENTRYPOINT	["sh", "/var/wordpress/auto_config.sh"] 
