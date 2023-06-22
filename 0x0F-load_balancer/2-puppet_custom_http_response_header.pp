# Install Nginx web server and create HTML pages

# Update package lists
exec { 'update-package-lists':
  command => 'apt-get update',
  path    => '/usr/bin',
}

# Install Nginx package
package { 'nginx':
  ensure  => installed,
  require => Exec['update-package-lists'],
}

# Create index.html file with "Hello World!" content
file { '/var/www/html/index.html':
  content => 'Hello World!',
  require => Package['nginx'],
}

# Configure Nginx default site
file { '/etc/nginx/sites-available/default':
  content => "
    server {
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

        add_header X-Served-By $hostname;
    }
  ",
  require => Package['nginx'],
}

# Restart Nginx service
service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => [File['/etc/nginx/sites-available/default']],
}
