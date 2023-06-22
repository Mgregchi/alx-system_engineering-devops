# Puppet manifest to install and configure Nginx on Ubuntu

# Install Nginx package
package { 'nginx':
  ensure   => installed,
  provider => 'apt',
}

# Create index.nginx-debian.html file with "Hello World!" content
file { '/var/www/html/index.nginx-debian.html':
  content => 'Hello World!',
  require => Package['nginx'],
}

# Configure redirection to GitHub for /redirect_me path
file { '/etc/nginx/sites-available/default':
  content => "server {
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
  }",
  require => Package['nginx'],
  notify  => Exec['restart_nginx'],
}

# Restart Nginx service
exec { 'restart_nginx':
  command     => '/usr/sbin/service nginx restart',
  refreshonly => true,
}
