#!/usr/bin/env bash
# install nginx web server and create html pages

sudo apt-get -y update
sudo apt-get install -y nginx
sudo ufw allow 'Nginx HTTP'

# Configure Nginx to listen on port 80
sudo sed -i 's/^\(listen\s*\)80;/\180;/g' /etc/nginx/sites-available/default

# Restart Nginx
sudo service nginx restart

# Create an index.html file with "Hello World!"
sudo sh -c 'echo "<html><body>Hello World!</body></html>" > /var/www/html/index.html'
