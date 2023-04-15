# Base image for the container from Docker Hub	
FROM debian:buster

# Expose command helps us to expose the port 9000 to the outside world. This is the port of the container that we want to expose to the outside world.
EXPOSE 9000

# Run command helps us to run the commands inside the container. We are running the commands to update the packages and install the required packages. After that with rm -rf /var/lib/apt/lists/* we are removing the cache of the packages. Because we want to keep the image size as small as possible.
RUN apt-get update && apt-get install -y php7.3-mysql php7.3-fpm curl mariadb-client  && rm -rf /var/lib/apt/lists/*

# COPY command helps us to copy something from the host machine to the container. In this case we are copying the www.conf file from the conf folder to the /etc/php/7.3/fpm/pool.d folder inside the container. The reason we need this configuration file is because we want to change the user and group of the php-fpm process. We want to change it to www-data because we want to have the same user and group for the php-fpm process and the nginx process. This way we can have the same user and group for the files that are created by the php-fpm process and the nginx process. This way we can avoid permission issues. The www.conf file is the configuration file for the web server or the PHP-FPM (FastCGI Process Manager) process pool.
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# Here with ADD command I am adding the latest version of wordpress to the container. With ADD command we can add files from the host machine to the container. With ADD command we can also download files from the internet. In this case I am downloading the latest version of wordpress from the internet. With ADD command I am adding the latest.tar.gz file to the /var/www folder inside the container.
ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

# Here with RUN command I am extracting the latest.tar.gz file. After that I am removing the latest.tar.gz file. The reason I am removing the latest.tar.gz file is because I don't need it anymore. I only need the extracted files. And I want to keep the image size as small as possible.
RUN cd /var/www && tar -xvf latest.tar.gz && rm -rf latest.tar.gz

# Here with curl we are downloading wordpress cli. With --output flag I am specfying the out file. With /usr/bin/wp I am specifying the path where I want to save the file. With --silent flag I am telling curl to not show the progress bar. With  chmod +x I am making the file executable. And finally with mkdir /run/php I am creating the directory where the php-fpm process will store the pid file.
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent && chmod +x ./usr/bin/wp && mkdir /run/php

# I copy the config.sh file from the conf folder to the /var/www/wordpress folder inside the container. After that I am making the config.sh file executable. And finally I am running the config.sh file.
COPY ./conf/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh
CMD ["bash", "/var/www/wordpress/config.sh"]
# With CMD command I am setting the default command that will be executed when the container is started. In this case I am running the config.sh file. The reason I don't use RUN command is because I want to run the config.sh file every time the container is started. This way I can make sure that the database is always up to date.