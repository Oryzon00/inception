FROM		debian:buster

RUN			apt update && apt upgrade -y &&	apt install -y	\
				wget			\
				php7.3			\
				php-fpm			\
				php-mysql		\
				mariadb-client

#Install with wget wordpress 6.1.1 into folder /var/www
RUN 		wget https://fr.wordpress.org/wordpress-6.1.1-fr_FR.tar.gz -P /var/www

# decompression et clean de wordpress
RUN 		cd /var/www; \
			tar -xzf wordpress-6.1.1-fr_FR.tar.gz; \ 
			rm wordpress-6.1.1-fr_FR.tar.gz

# droit root sur dossier wordpress
RUN		chown -R root:root /var/www/wordpress
