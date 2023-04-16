#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
apt install -y sudo ufw docker docker-compose make openbox xinit kitty firefox-esr

if [ -d "/home/$USER/data" ]; then \
	echo "/home/$USER/data already exists"; else \
	mkdir /home/$USER/data; \
	echo "data directory created successfully"; \
fi

if [ -d "/home/$USER/data/wordpress" ]; then \
	echo "/home/$USER/data/wordpress already exists"; else \
	mkdir /home/$USER/data/wordpress; \
	echo "wordpress directory created successfully"; \
fi

if [ -d "/home/$USER/data/mariadb" ]; then \
	echo "/home/$USER/data/mariadb already exists"; else \
	mkdir /home/$USER/data/mariadb; \
	echo "mariadb directory created successfully"; \
fi