FROM		debian:buster

# Install basics
RUN			apt update && apt upgrade -y &&	apt install -y	\
				nginx	\
				vim		\
				curl	\
				openssl

# Create ssl certificate and key
RUN			mkdir -p /etc/nginx/ssl && \
			openssl req -x509 -nodes \
				-out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key \
				-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ajung.42.fr/UID=ajung"

# config repo of NGINX
RUN			mkdir -p /var/run/nginx
RUN			rm -f /etc/nginx/nginx.conf

COPY		conf/nginx.conf /etc/nginx/nginx.conf

# Test
RUN			cat /etc/nginx/nginx.conf 
