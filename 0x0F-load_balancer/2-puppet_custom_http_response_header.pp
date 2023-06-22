# Puppet manifest to install and configure Nginx on Ubuntu

# Install Nginx package
package { 'nginx':
  provider => 'apt',
}

# Create index.nginx-debian.html file with "Hello World!" content
exec { 'home_page':
  command => '/usr/bin/sudo /bin/echo Hello World! > /var/www/html/index.nginx-debian.html',
}

# Configure redirection to github for /redirect_me path
$server_config = "server {
      listen 80;
      listen [::]:80 default_server;
      root   /var/www/html/;
      index  index.html;

      # Redirect /redirect_me path with a 301 status code
      location /redirect_me {
          return 301 https://github.com/mgregchi permanent;
      }

      error_page 404 /custom_404.html;

      location = /custom_404.html {
          root /var/www/html;
          internal;
      }

      add_header X-Served-By $hostname;
  }
"
# Add custom config
exec { 'custom_http_header':
  command => '/usr/bin/echo /bin/echo ${server_config} > /etc/nginx/sites-available/default',

}

# Start Nginx service
exec { 'start_server':
  command => '/usr/bin/sudo /usr/sbin/service nginx start',
}
