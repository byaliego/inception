# Base image
FROM debian:buster

# ARGs are used to pass variables from the docker-compose.yml file
ARG DB_NAME=${DB_NAME}
ARG DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}
ARG DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD}

# Here we install mariadb and clean up to keep the image small
RUN apt-get update && apt-get install mariadb-server -y && rm -rf /var/lib/apt/lists/*

# Here we remove the default configuration file 
RUN rm /etc/mysql/mariadb.conf.d/server.cnf

# Here we copy the configuration file to the container
COPY conf/server.cnf /etc/mysql/mariadb.conf.d

# Here we copy the script, we run it in the next step
COPY setup/user_create.sh /

# Here we run the script to create the database and user. Then we remove the script
RUN bash ./user_create.sh && rm ./user_create.sh

# Here we expose the port to other containers, but not to host
EXPOSE 3306

CMD ["mysqld_safe"]
