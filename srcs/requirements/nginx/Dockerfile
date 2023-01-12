FROM		debian:buster

# Install nginx open SSL
RUN			apt update && apt upgrade -y &&	apt install -y	\
				nginx	\
				openssl

# Create ssl certificate and key
RUN			mkdir -p /etc/nginx/ssl
RUN			openssl req -x509 -nodes \
				-out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key \
				-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ajung.42.fr/UID=ajung"

# config repo of NGINX
RUN			mkdir -p /var/run/nginx
COPY		conf/nginx.conf /etc/nginx/conf.d/nginx.conf

# Check rights and owner
RUN			chmod 755 /var/www/html
RUN			chown -R www-data:www-data /var/www/html

# Start nginx, no daemon so container does not stop
CMD 		[ "nginx", "-g", "daemon off;" ]


