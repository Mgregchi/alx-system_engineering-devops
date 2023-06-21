# Puppet manifest to install and configure Nginx on Ubuntu

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure => running,
  enable => true,
}

# Create the index.html file with "Hello World!" content
file { '/var/www/html/index.html':
  content => '<html><body>Hello World!</body></html>',
}

# Configure Nginx default site
file { '/etc/nginx/sites-available/default':
  content => '
    server {
        listen 80;
        root /var/www/html;
        
        # Handle requests for the root path
        location / {
            try_files $uri $uri/ =404;
        }
        
        # Redirect requests for /redirect_me path with a 301 status code
        location /redirect_me {
            return 301 http://example.com/;
        }
    }
  ',
  notify => Service['nginx'],
}

# Reload Nginx configuration if changes are made
exec { 'nginx_reload':
  command     => 'service nginx reload',
  refreshonly => true,
}
