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
   docker build -t alx-apache-image .
   ```

   This command will build a Docker image with the tag `alx-apache-image` based on the Dockerfile in the current directory (`.`).

7. Run a Docker container using the built image:

   ```bash
   docker run -d -p 8080:80 --name my-apache-container alx-apache-image
   ```

   This command starts a Docker container named `alx-apache-container` using the `my-apache-image` image. Port 80 of the container is mapped to port 8080 on the host machine.

8. Access the Apache server running inside the container:

   Open a web browser and visit `http://localhost:8080`. You should see the page containing "Hello Holberton" displayed.

That's it! You now have Apache running inside a Docker container, serving a page containing "Hello Holberton" when querying the root.
