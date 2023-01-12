FROM			debian:buster

RUN			apt update && apt upgrade -y &&	apt install -y	\
			mariadb-server

COPY		conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY		tools/init_DB.sh		/etc/mysql/
RUN			chmod 777 /etc/mysql/init_DB.sh

CMD			/etc/mysql/init_DB.sh 
