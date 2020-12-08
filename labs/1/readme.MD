# How to build 125 years worth of software value in an afternoon
Open source software can be an enormous source of value when you are building other software to solve problems. 
Well run projects provide welcoming environments for newcomers. 
Mature successful projects evolve the software engineering practices necessary to allow the software project to deliver value to large user communities and support large developer communities that want to contribute.  

# Objectives
* Establish that the software development environment works for all students taking the class. 
* Download and build a large piece of software from scratch, then deploy it to prove it worked. 
* Analyze the software at a very high level to understand the value that was just built and installed. 
* Analyze the project at a high level to understand what sorts of on-ramps were provided for new users. 

# Instructions
It is assumed the student already has `Vagrant` and `Virtualbox` installed and running on their machine. 

Start a Linux command-line shell on your machine. At the command line prompt, create a directory for the Lab 1 work. 
```
$ mkdir Lab1
$ cd Lab1
```
Create the Vagrantfile for this lab into a file called Vagrantfile. 
A Vagrantfile describes the basic virtual machine that the vagrant tool will create for us. 
We are going to use a simple cut-and-paste construct in the shell called a HERE document and the cat program. 

```
$ cat <<EOF >Vagrantfile
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provision :shell, path: "bootstrap-ubuntu.sh"
end
EOF 
```
You could create the file with your favorite editor if it is available. 
You could also clone the Lab1 project directory with git. 

A quick inspection of the Vagrantfile shows us what it will do. (Lines starting with a '#' are comments.)  
Essentially it will fetch and build a 'box' of the latest Ubuntu Linux build (ubuntu/focal64 which is the official Canonical build of Focal Fossa). 
Then it will provision the newly created virtual machine with a shellscript (bootstrap-ubuntu.sh). 

Let's copy the provisioning script into a file called bootstrap-ubuntu.sh as well. 
```
$ cat <<EOF >bootstrap-ubuntu.sh
#!/usr/bin/env bash

# Ensure apt-get world is as sane as possible.
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

# On the vagrant machine ...
# Set up ntp to keep the vagrant machine in time (vagrant/virtualbox loses sync when some hosts sleep.)
sudo apt-get -y install ntp ntpdate

# Install git
sudo apt-get -y install git

# Install go (Current stable is 1.8.x, but xenial seems to be stuck on 1.6.2)
# So I apt-get install, but then manually update. I appreciate this is probably too much.
mkdir -p /home/ubuntu/work
# echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> /home/ubuntu/.bashrc
echo 'set -o vi' >> /home/ubuntu/.bashrc
# echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> /home/ubuntu/.profile
echo 'set -o vi' >> /home/ubuntu/.profile
source /home/ubuntu/.profile

# You now have an OCI ready Ubuntu Xenial machine in VirtualBox.
# Almost. There are still golang man dependencies to install for runtime-tools
# You might want to add the export lines to your .profile

sudo apt-get -y update
sudo apt-get -y upgrade

# Fix ownership of bootstrapped files to vagrant user
sudo chown -R ubuntu /home/ubuntu/work
sudo chgrp -R ubuntu /home/ubuntu/work
EOF
```
At this point, we should be in a directory on your machine for Lab1 that contains two files. 
```
$ ls
Vagrantfile         bootstrap-ubuntu.sh
```
Let's start the machine!
```
$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Box 'ubuntu/focal64' could not be found. Attempting to find and install...
    default: Box Provider: virtualbox
    default: Box Version: >= 0
==> default: Loading metadata for box 'ubuntu/focal64'
...
lots of output as the virtual machine is started, 
the box is downloaded and installed, 
and the new virtual machine provisioned. 
... 
    default: Reading package lists...
    default: Reading package lists...
    default: Building dependency tree...
    default: Reading state information...
    default: Calculating upgrade...
    default: 0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
$ 
```
At this point we can log into our virtual machine via vagrant. 
```
$ vagrant ssh
Welcome to Ubuntu 20.04.1 LTS (GNU/Linux 5.4.0-56-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Dec  8 06:03:07 UTC 2020

  System load:  0.0               Processes:               112
  Usage of /:   3.6% of 38.71GB   Users logged in:         0
  Memory usage: 21%               IPv4 address for enp0s3: 10.0.2.15
  Swap usage:   0%


0 updates can be installed immediately.
0 of these updates are security updates.


vagrant@ubuntu-focal:~$
```
Let's look around. 
```
vagrant@ubuntu-focal:~$ ls -a
.  ..  .bash_logout  .bashrc  .cache  .profile  .ssh
vagrant@ubuntu-focal:~$
```
The `-a` option on the `ls` command lists all files including those that start with a `.` that would otherwise be hidden. 

## Fetching Apache
The first project we want to build as a test of open source goodness is the original Apache webserver (httpd). 
Finding the project becomes a first test of the community itself. How easy is it to find? 
Plug the following search into Google: `build apache httpd from source`
The first hit is hopefully: https://httpd.apache.org/docs/current/install.html 

If you visit this URL you discover yourself in a page that takes you through the entire build and install for what is still the webserver driving half the traffic of the World Wide Web. 
Have a read through the page. 
It is an interesting study in the assumptions the community makes about a developer working in this space. 
As well as the summary at the top the page (the section Installing from source), the page provides detailed instructions for each step. 

One of the first things we will need to do is to download the sources. 
If we follow the Download link in the summary section, then it takes us to the download page: https://httpd.apache.org/download.cgi#apache24 
Let's use the `curl` utility and the link to the current stable compressed (`gzip`) `tar` archive. 
(As of this writing the current version is 2.4.46.)

```
vagrant@ubuntu-focal:~$ curl https://mirrors.gigenet.com/apache//httpd/httpd-2.4.46.tar.gz -o httpd-2.4.46.tar.gz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 9143k  100 9143k    0     0  5846k      0  0:00:01  0:00:01 --:--:-- 5846k
vagrant@ubuntu-focal:~$ 
```
A good habit when dealing with software from new or untrusted sites is to check the SHA256 signature to ensure the file hasn't been tampered with.
In this case, if you follow the url you will see: 
```
## Unpacking and building Apache httpd
Let's unpack the archive. It is a gzip compressed `tar` archive (a common source compression utility and format).
> **Fun Historical Fact:**
> `tar` is short for *tape archive*. It is the original archiving tool for UNIX which was instantiated in POSIX.1 standard in 1988. 
> It still forms the basis for a lot of archives on the Web. It is the basis for modern container formats. 
>

## Install, Run, Test our Build

## What about the 125 years of value? 

## Clean up


44b759ce932dc090c0e75c0210b4485ebf6983466fb8ca1b446c8168e1a1aec2 *httpd-2.4.46.tar.gz

```
If we run the `sha256sum` utility that comes with Ubuntu, we can compare the file we just downloaded from the Apache site with their SHA256 signature. 
```
vagrant@ubuntu-focal:~$ sha256sum httpd-2.4.46.tar.gz
44b759ce932dc090c0e75c0210b4485ebf6983466fb8ca1b446c8168e1a1aec2  httpd-2.4.46.tar.gz
vagrant@ubuntu-focal:~$
```
