FROM			debian:buster

RUN			apt update && apt upgrade -y &&	apt install -y	\
			mariadb-server \
			mariadb-client

COPY		conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY		tools/init_DB.sh		/etc/mysql/
COPY		tools/init_DB.sql		/etc/mysql/
RUN			chmod 777 /etc/mysql/init_DB.sh

EXPOSE		3306

ENTRYPOINT	["sh",  "/etc/mysql/init_DB.sh"]
