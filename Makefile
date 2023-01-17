HOME			=	/home/ajung

DOCKER_COMPOSE	=	sudo docker-compose

all:	folders
		$(DOCKER_COMPOSE) -f srcs/docker-compose.yml up -d

folders:
		mkdir -p $(HOME)/data/mariadb_volume
		mkdir -p $(HOME)/data/wordpress_volume

stop:
		$(DOCKER_COMPOSE) -f srcs/docker-compose.yml stop

clean:	stop
		sudo docker system prune -f -a

fclean:	clean
		sudo rm -rf $(HOME)/data

re: fclean all

.PHONY: folders all stop clean fclean re
	
