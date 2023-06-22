# Puppet manifest to install and configure Nginx on Ubuntu

# Update package lists
exec { 'install_update':
    command => '/usr/bin/sudo /usr/bin/apt-get update',
}

# Install Nginx package
exec { 'install_nginx':
    command => '/usr/bin/sudo /usr/bin/apt-get install -y nginx',
}

# Create index.nginx-debian.html file with "Hello World!" content
exec { 'home_page':
  command => '/usr/bin/sudo /bin/echo Hello World! > /var/www/html/index.html',
}

# Create custom_404.html file with "Ceci n'est pas une page" content
exec { 'custom_404':
  command => '/usr/bin/sudo /bin/echo Ceci nest pas une page > /var/www/html/custom_404.html',
}

$config = "server {
    listen 80;
    listen [::]:80 default_server;
    root   /var/www/html/;
    index  index.html;

    # Redirect /redirect_me path with a 301 status code
    location /redirect_me {
        return 301 https://github.com/mgregchi;
    }

    error_page 404 /custom_404.html;

    location = /custom_404.html {
        root /var/www/html;
        internal;
    }

    add_header X-Served-By '$hostname';
}"

# Custom Configuration
exec { 'add_config':
  command => "/usr/bin/sudo /usr/bin/echo '${config}' > /etc/nginx/sites-available/default",
}


# Start Nginx service
exec { 'start_server':
  command => '/usr/bin/sudo /usr/sbin/service nginx restart',
}
