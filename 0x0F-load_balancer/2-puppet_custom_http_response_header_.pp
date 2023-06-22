# Puppet manifest to install and configure Nginx on Ubuntu

# Install Nginx package
package { 'nginx':
  provider => 'apt',
}

# Create index.nginx-debian.html file with "Hello World!" content
exec { 'home_page':
  command => '/usr/bin/sudo /bin/echo Hello World! > /var/www/html/index.nginx-debian.html',
}

# Configure redirection to Github for /redirect_me path
exec { 'redirect_page':
  command => '/usr/bin/sudo /bin/sed -i "66i rewrite ^/redirect_me https://github.com/mgregchi permanent;" /etc/nginx/sites-available/default',
}

# Add X-Served-By $hostname to http header
exec { 'add_custom_http_header':
  command => '/usr/bin/sudo /bin/sed -i "^/location \/redirect_me {[^}]*}/a add_header X-Served-By $hostname;" /etc/nginx/sites-available/default',
}

# Start Nginx service
exec { 'start_server':
  command => '/usr/bin/sudo /usr/sbin/service nginx start',
}
