# 0x0C. Web server
---

## Concepts

For this project, we expect you to look at this concept:

- [What is a Child Process?]()

## Description

This project in the System Engineering & Devops series is about:

----
Update
----

How the web works
Nginx
How to Configure Nginx
Child process concept page
Root and sub domain
HTTP requests
HTTP redirection
Not found HTTP response code
Logs files on Linux

### For reference:

RFC 7231 (HTTP/1.1)
RFC 7540 (HTTP/2)

>> Fix /var/www/html/index.html: Permission denied
```
# 1. Change owner of /var/www/html directory to apache user, here: www-data
sudo chown -R www-data:www-data /var/www/html

# 2. Allow Group to edit
sudo chmod -R 775 /var/www/html

# 3. Add yourself to apache group(www-data)
sudo usermod -a -G www-data ${USER}

# if 3 does not work
sudo chmod o+w /var/www/html
```

### man or help:

- scp
- curl

---

* What DNS stands for
* What is DNS main role
* What are DNS record types for:
* A
* CNAME
* TXT
* MX
* What is the main role of a web server
* What is a child process
* Why web server usually have a parent process and child processes
* What are the main HTTP requests
* [-y on apt-get command]https://askubuntu.com/questions/672892/what-does-y-mean-in-apt-get-y-install-command)


## How it works
These scripts is automated to setup/deploy an Nginx webserver with minor configurations and transfer minimal settings and contents

## How it compile
No need to do anything since they are Bash scripts and already executable

## Files
---
File|Task
---|---
0-transfer_file | Bash script that transfers a file from our client to a server
1-install_nginx_web_server | Installing NGINX web server
2-setup_a_domain_name | Setup a domain name
4-not_found_page_404 | Configuring NGINX server to have a customer 404 page

## Directories
---
Directory Name | Description
---|---
0x0C-web_server | Folder with all the main files


.