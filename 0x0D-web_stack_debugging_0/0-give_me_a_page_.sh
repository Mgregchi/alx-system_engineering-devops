#!/usr/bin/env bash
# Run Apache on container and to return a page containing a string
mkdir apache-docker
cd apache-docker

echo "# Use the official Apache base image
    FROM httpd:latest

    # Copy custom index.html file to Apache document root
    COPY index.html /usr/local/apache2/htdocs/

    # Expose port 80
    EXPOSE 80
" > Dockerfile

# Create a file named index.html with Hello Holberton as content
echo "Hello Holberton" > index.html

# Build a docker image with the tag alx-apache-image
sudo docker build -t alx-apache-image .

# This command starts a Docker container named my-apache-container using the alx-apache-image image.
# Port 80 of the container is mapped to port 8080 on the host machine.
docker run -d -p 8080:80 --name alx-apache-container alx-apache-image
