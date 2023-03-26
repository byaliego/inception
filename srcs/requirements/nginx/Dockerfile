FROM alpine:3.14

# Update the packages and then install the nginx package
# We use the --no-cache option to avoid caching the package index because we don't want to keep the package index on our image in order to keep it as small as possible. It is best practice to always use this option when installing packages.
RUN apk update
RUN apk upgrade
RUN apk add --no-cache nginx
################################


# Copy the nginx.conf file to the nginx configuration directory
COPY ./conf/nginx.conf /etc/nginx/conf.d
###################################

EXPOSE 443

# Start the nginx server
CMD ["nginx", "-g", "daemon off;"]