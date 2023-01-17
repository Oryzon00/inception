HOME			=	/home/ajung

DOCKER_COMPOSE	=	sudo docker compose

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
		docker volume ls -q | xargs -r docker volume rm -f
		sudo rm -rf $(HOME)/data

re: fclean all

.PHONY: folders all stop clean fclean re
	
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# cant docker compose
