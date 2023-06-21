To configure Apache to listen on port 8080 instead of the default port 80, you need to modify the Apache configuration file. Here's an updated version of the script that sets up Apache to listen on port 8080:

```bash
#!/bin/bash

# Update the package lists
sudo apt-get update

# Install Apache
sudo apt-get install -y apache2

# Modify Apache port configuration
sudo sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf

# Modify Apache virtual host configuration
sudo sed -i 's/:80>/:8080>/' /etc/apache2/sites-available/000-default.conf

# Restart Apache for the changes to take effect
sudo systemctl restart apache2

# Display status and information
sudo systemctl status apache2
```

Save the script to a file, for example, `configure-apache.sh`, and then make it executable by running:

```bash
chmod +x configure-apache.sh
```

Execute the script by running:

```bash
./configure-apache.sh
```

The script will update the package lists, install Apache, modify the Apache configuration files to listen on port 8080, restart Apache for the changes to take effect, and display the status and information about Apache.

Please make sure to run the script with appropriate permissions or as a user with sufficient privileges to install packages and modify system files.



To run Apache inside a Docker container and configure it to return a page containing "Hello Holberton" when querying the root, you can create a Dockerfile and build a custom Docker image. Here's an example:

1. Create a new directory for your project and navigate to it:

   ```bash
   mkdir apache-docker
   cd apache-docker
   ```

2. Create a file named `Dockerfile` (without any file extension) and open it in a text editor:

   ```bash
   touch Dockerfile
   nano Dockerfile
   ```

3. Add the following content to the Dockerfile:

   ```Dockerfile
   # Use the official Apache base image
   FROM httpd:latest

   # Copy custom index.html file to Apache document root
   COPY index.html /usr/local/apache2/htdocs/

   # Expose port 80
   EXPOSE 80
   ```

   Save and exit the text editor.

4. Create a file named `index.html` and open it in a text editor:

   ```bash
   touch index.html
   nano index.html
   ```

5. Add the following content to the index.html file:

   ```html
   <!DOCTYPE html>
   <html>
   <head>
       <title>Hello Holberton</title>
   </head>
   <body>
       <h1>Hello Holberton</h1>
   </body>
   </html>
   ```

   Save and exit the text editor.

6. Build the Docker image using the Dockerfile:

   ```bash
   docker build -t my-apache-image .
   ```

   This command will build a Docker image with the tag `my-apache-image` based on the Dockerfile in the current directory (`.`).

7. Run a Docker container using the built image:

   ```bash
   docker run -d -p 8080:80 --name my-apache-container my-apache-image
   ```

   This command starts a Docker container named `my-apache-container` using the `my-apache-image` image. Port 80 of the container is mapped to port 8080 on the host machine.

8. Access the Apache server running inside the container:

   Open a web browser and visit `http://localhost:8080`. You should see the page containing "Hello Holberton" displayed.

That's it! You now have Apache running inside a Docker container, serving a page containing "Hello Holberton" when querying the root.

