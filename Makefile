# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yogun <yogun@student.42heilbronn.de>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/26 18:27:01 by yogun             #+#    #+#              #
#    Updated: 2023/04/15 02:04:48 by yogun            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# Colors
GREEN = \033[1;32m
CYAN = \033[1;36m
YELLOW = \033[1;33m
RESET = \033[0m
RED = \033[0;31m

all:
	@sudo hostsed add 127.0.0.1 yogun.42.fr && echo "successfully added yogun.42.fr to /etc/hosts"
	sudo docker compose -f ./srcs/docker-compose.yml up -d

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v
#	uncomment the following line to remove the images too
#	sudo docker system prune -a

fclean: clean
	@sudo hostsed rm 127.0.0.1 yogun.42.fr && echo "successfully removed yogun.42.fr to /etc/hosts"
	@if [ -d "/home/yogun/data/wordpress" ]; then \
	sudo rm -rf /home/yogun/data/wordpress/* && \
	echo "successfully removed all contents from /home/yogun/data/wordpress/"; \
	fi;

	@if [ -d "/home/yogun/data/mariadb" ]; then \
	sudo rm -rf /home/yogun/data/mariadb/* && \
	echo "successfully removed all contents from /home/yogun/data/mariadb/"; \
	fi;

re: fclean all

ls:
	sudo docker image ls
	sudo docker ps

.PHONY: all, clean, fclean, re, ls