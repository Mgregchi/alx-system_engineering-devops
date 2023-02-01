# 0x08. Networking basics #1

## Resources
**Read or watch:**

- [What is localhost](https://en.m.wikipedia.org/wiki/Localhost)
- [What is 0.0.0.0](https://en.m.wikipedia.org/wiki/0.0.0.0)
- [What is the hosts file](https://www.makeuseof.com/tag/modify-manage-hosts-file-linux/)
- [Netcat examples](https://www.thegeekstuff.com/2012/04/nc-command-examples/)

**man or help:**

- ifconfig
- telnet
- nc
- cut


## Learning Objectives

* What is localhost/127.0.0.1
* What is 0.0.0.0
* What is `/etc/hosts`
* How to display your machine’s active network interfaces


## General Requirements

- All your files will be interpreted on Ubuntu 20.04 LTS
- All your files should end with a new line
- A `README.md` file, at the root of the folder of the project, is mandatory
- All your Bash script files must be executable
- Your Bash script must pass `Shellcheck` (version 0.7.0 via `apt-get`) without any errors
- The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
- The second line of all your Bash scripts should be a comment explaining what is the script doing


## Files
---
|File|Task|
|---|---|
|0-change_your_home_IP | Bash script that config an Ubuntu server|
|1-show_attached_IPs | Bash script that displays active IPV4 IPs|
|istening_on_localhost | Script using nc to listen port 98 on localhost|
|README.md|Project description|

## Directories
---
Directory Name | Description
---|---
0x08-networking_basics_2 | Main directory with answers and Bash scripts
