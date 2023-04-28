# 0x14. Mysql
---

## Concepts

For this project, we expect you to look at these concepts:

- [Database administration]()
- [Web stack debugging]()
- [[How to] Install mysql 5.7](https://gist.github.com/Mgregchi/2a260efa96cfa7885a40e6c7a5d3af11#file-how_to_install_mysql_5-7_ubuntu-md)

## Resources 

**Read or watch:**

- [What is a primary-replica cluster](https://www.digitalocean.com/community/tutorials/how-to-choose-a-redundancy-plan-to-ensure-high-availability#sql-replication)
- [MySQL primary replica setup](https://www.digitalocean.com/community/tutorials/how-to-set-up-replication-in-mysql)
- [Build a robust database backup strategy](https://www.databasejournal.com/ms-sql/developing-a-sql-server-backup-strategy/)

**man or help:**

* mysqldump



## Description

This project in the System engineering & DevOps ― Web stack series is about:
* What is the main role of a database
* What is a database replica
* What is the purpose of a database replica
* Why database backups need to be stored in different physical locations
* What operation should you regularly perform to make sure that your database backup strategy actually works

## Main objective and why?
Install and configure MySQL on 404-web-01 and 404-web-02 so that they form a primary/replica (master/slave) cluster.
1. Redundancy: If you lose one of the database servers, you will still have another working one and a copy of your data
2. Load distribution: You can split the read operations between the 2 servers, reducing the load on the primary member and improving query response speed

## Note
All Bash Script need to be executable and passes Shellcheckversion 0.3.3-1~ubuntu14.04.1) without any error

## Files
---
File|Task
---|---
0-mysql_configuration_primary, 0-mysql_configuration_replica | Primary and Replica configuration after installation
1-mysql_backup | Bash script that generates a MySQL dump and creates a compressed archive out of it.

## Directories
---
Directory Name | Description
---|---
0x14-mysql/ | Main folder with all Bash Scripts to setup MYSQL primary replica


.
