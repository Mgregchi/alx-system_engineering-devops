# 0x0A Configuration management
---

## Resources

**Read or watch:**

- [Intro to Configuration Management](https://www.digitalocean.com/community/tutorials/an-introduction-to-configuration-management)
- [Puppet resource type: file (check “Resource types” for all manifest types in the left menu)](https://www.puppet.com/docs/puppet/5.5/types/file.html)
- [Puppet’s Declarative Language: Modeling Instead of Scripting](https://www.puppet.com/blog)
- [Puppet lint](http://puppet-lint.com/)
- [Puppet emacs mode](https://github.com/voxpupuli/puppet-mode)


## Description

This project in the System Engineering & DevOps-CI/CD series is about:
* Automating server configuration with Puppet
* Decreasing repetitive tasks for multiple server deployment
* Managing manifests
* Understand Puppet Syntax
* Introduction to Configuration Management
* Puppet resourse types
* Puppet formating and using Puppet lint



## General Requirements

- All your files will be interpreted on Ubuntu 20.04 LTS
- All your files should end with a new line
- A README.md file at the root of the folder of the project is mandatory
- Your Puppet manifests must pass puppet-lint version 2.1.1 without any errors
- Your Puppet manifests must run without error
- Your Puppet manifests first line must be a comment explaining what the Puppet manifest is about
- Your Puppet manifests files must end with the extension .pp

### Note on Versioning

Your Ubuntu 20.04 VM should have Puppet 5.5 preinstalled.

### Install puppet

```
$ apt-get install -y ruby=1:2.7+1 --allow-downgrades
$ apt-get install -y ruby-augeas
$ apt-get install -y ruby-shadow
$ apt-get install -y puppet
```
You do **not** need to attempt to upgrade versions. This project is simply a set of tasks to familiarize you with the basic level syntax which is virtually identical in newer versions of Puppet.

[Puppet 5 Docs](https://www.puppet.com/docs/puppet/5.5/puppet_index.html)

### Install puppet-lint
```
$ gem install puppet-lint
```


## Files
---
File|Task
---|---
0-create_a_file.pp | create a file for /tmp directory
1-install_a_package.pp | using puppet to install puppet-lint
2-execute_a_command.pp | create a manifest to kill a process with name argument

## Directories
---
Directory Name | Description
---|---
0x0A-configuration_management | directory with all puppet files
