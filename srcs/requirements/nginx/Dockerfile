# Base image
FROM debian:buster													

## Install nginx, openssl, and clean up to keep the image small
RUN apt-get update && apt-get install -y nginx openssl && rm -rf /var/lib/apt/lists/*

# Copy the nginx configuration file
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

# openssl command generates a self-signed certificate
RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt -sha256 -subj "/CN=yogun.42.fr"

# Here with CMD command we can run the nginx server
CMD ["nginx", "-g", "daemon off;"]