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
It is also assumed that the student has cloned the course from Github. 

> The shell command prompt is shown as a `$`, sometimes with a machine+directory identifier (e.g. `MacBook-Pro labs$`).
> Expected output then follows (possibly truncated with `...` if there is a lot of output). 
> You are expected to type what follows the `$`, hitting a `<RETURN>` key at the end of the command.
> In the following example, you will type `git clone https://github.com/stephenrwalli/JHU-EN.601.210.git<RETURN>`, see the displayed output, 
> then type `ls<RETURN>`. 
>
> Also, a '#' generally denotes a comment in a command line. Anything from a '#' to the end of the line need not be typed. 
>

Start a Linux command-line shell on your machine. 
At the command line prompt, change directory to the lab 1 directory for the course. 
These instructions assume the student cloned the course into their home directory. 
```
$ cd JHU-EN.601.210/
$ ls
LICENSE   README.md labs      lessons
$ cd labs/1
$ ls
Vagrantfile         bootstrap-ubuntu.sh readme.MD
$
```
A Vagrantfile describes the basic virtual machine that the `vagrant` tool will create for us. 
A quick inspection of the Vagrantfile shows us what it will do. (Lines starting with a '#' are comments.)  
Essentially it will fetch and build a 'box' of the latest Ubuntu Linux build (ubuntu/focal64 which is the official Canonical build of Focal Fossa). 
Then it will provision the newly created virtual machine with a shellscript (bootstrap-ubuntu.sh). 
```
$ cat Vagrantfile
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
$
```

Let's have a quick look at the provisioning script (`bootstrap-ubuntu.sh`) as well. 
It does a little housekeeping to ensure the ubuntu packaging databases are up-to-date for when we need to install software later. 
```
$ cat bootstrap-ubuntu.sh
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
$
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
Have a glance through the page. 
> N.B. There is a requirements section. We will come back to that section soon-ish.

It is an interesting study in the assumptions the community makes about a developer working in this space. 
As well as the summary at the top the page (the section Installing from source), the page provides detailed instructions for each step. 
Those instruction still make interesting assumptions about the historical knowledge of a reader. 

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
44b759ce932dc090c0e75c0210b4485ebf6983466fb8ca1b446c8168e1a1aec2 *httpd-2.4.46.tar.gz

```
If we run the `sha256sum` utility that comes with Ubuntu, we can compare the file we just downloaded from the Apache site with their SHA256 signature. 
```
vagrant@ubuntu-focal:~$ sha256sum httpd-2.4.46.tar.gz
44b759ce932dc090c0e75c0210b4485ebf6983466fb8ca1b446c8168e1a1aec2  httpd-2.4.46.tar.gz
vagrant@ubuntu-focal:~$
```

## Unpacking and building Apache httpd
Let's unpack the archive. It is a gzip compressed `tar` archive (a common source compression utility and format).
Once `tar` begins you will see the verbose output listing of all the files unpacked from the archive because we used the `v` option for the extraction (`x`). 
```
vagrant@ubuntu-focal:~$ gunzip httpd-2.4.46.tar.gz
vagrant@ubuntu-focal:~$ tar xvf httpd-2.4.46.tar
... 
httpd-2.4.46/server/util.c
httpd-2.4.46/server/util_expr_parse.h
httpd-2.4.46/server/request.c
vagrant@ubuntu-focal:~$ 
```
> **Fun Historical Fact:**
> `tar` is short for *tape archive*. It is the original archiving tool for UNIX which was instantiated in POSIX.1 standard in 1988. 
> It still forms the basis for a lot of archives on the Web. It is the basis for modern container formats. 
>

Listing the files now shows the tar archive and a directory. Let's step into the directory and list the files. 
```
vagrant@ubuntu-focal:~$ ls
httpd-2.4.46  httpd-2.4.46.tar
vagrant@ubuntu-focal:~$ cd httpd-2.4.46
vagrant@ubuntu-focal:~/httpd-2.4.46$ ls
ABOUT_APACHE     CHANGES         LICENSE        README            acinclude.m4     config.layout  httpd.dep   libhttpd.dep  server
Apache-apr2.dsw  CMakeLists.txt  Makefile.in    README.cmake      ap.d             configure      httpd.dsp   libhttpd.dsp  srclib
Apache.dsw       INSTALL         Makefile.win   README.platforms  apache_probes.d  configure.in   httpd.mak   libhttpd.mak  support
BuildAll.dsp     InstallBin.dsp  NOTICE         ROADMAP           build            docs           httpd.spec  modules       test
BuildBin.dsp     LAYOUT          NWGNUmakefile  VERSIONING        buildconf        emacs-style    include     os
vagrant@ubuntu-focal:~/httpd-2.4.46$ 
```
There is an array of files. From long experience I know there are multiple build files for multiple operating systems. 
It is probably a good moment to go back to the 'instuctions'. 
The **Requirements** section on Installation page contains reference to a list of software that you will need to build Apache.
In the Ubuntu linux world, the tool for installing and updating software is `apt`. 
It keeps track of dependencies required in a database. 
It also requires that you have super-user privilege to access the database and install the software in our limited environment.
To do this, we preface any command requiring 'super-user' privilege with `sudo`. 
The `apt` and `apt-get` utilities will often prompt for a `Y` to ensure you want to install the software. 
We will use the `-y` option of the command line to force the affirmative answer. 
The list of things for us to install according to the **Requirements** section looks like the following. 
(There will be lots of output after each install.)
```
vagrant@ubuntu-focal:~/httpd-2.4.46$ sudo apt install -y make
vagrant@ubuntu-focal:~/httpd-2.4.46$ sudo apt install -y make-guile
vagrant@ubuntu-focal:~/httpd-2.4.46$ sudo apt install -y gcc
vagrant@ubuntu-focal:~/httpd-2.4.46$ sudo apt-get install -y libapr1 libapr1-dev   # APR 
vagrant@ubuntu-focal:~/httpd-2.4.46$ sudo apt-get install APR-util                 # and APR-util
vagrant@ubuntu-focal:~/httpd-2.4.46$ sudo apt-get install -y apache2-dev           # because apparently as you tease it apart we still need this.
vagrant@ubuntu-focal:~/httpd-2.4.46$ sudo apt-get install -y libpcre3 libpcre3-dev # PCRE
```
Our machine provisioning installed ntp (Network Time Protocol) and you can confirm you have an appropriate version of Perl by asking for the version.
```
vagrant@ubuntu-focal:~/httpd-2.4.46$ perl --version

This is perl 5, version 30, subversion 0 (v5.30.0) built for x86_64-linux-gnu-thread-multi
(with 50 registered patches, see perl -V for more detail)

Copyright 1987-2019, Larry Wall

Perl may be copied only under the terms of either the Artistic License or the
GNU General Public License, which may be found in the Perl 5 source kit.

Complete documentation for Perl, including FAQ lists, should be found on
this system using "man perl" or "perldoc perl".  If you have access to the
Internet, point your browser at http://www.perl.org/, the Perl Home Page.

vagrant@ubuntu-focal:~/httpd-2.4.46$
```
Now we will use the `configure` script and `make` utility to build the world. 
This is often the first place of real trial and error. 
If there is a configure script, then the software has likely been built on a lot of different platforms, which *should* be helpful.
There are still holes. 
For example, as I read the instructions and tried the configure script, some things still required a little extra searching on the Web.
(A good example is the need for the installation of `apache2-dev` above.)
```
vagrant@ubuntu-focal:~/httpd-2.4.46$ ./configure
... lots of output
vagrant@ubuntu-focal:~/httpd-2.4.46$ make
... lots more output
/usr/share/apr-1.0/build/libtool --silent --mode=link x86_64-linux-gnu-gcc  -pthread           -o mod_rewrite.la -rpath /usr/local/apache2/modules -module -avoid-version  mod_rewrite.lo
make[4]: Leaving directory '/home/vagrant/httpd-2.4.46/modules/mappers'
make[3]: Leaving directory '/home/vagrant/httpd-2.4.46/modules/mappers'
make[2]: Leaving directory '/home/vagrant/httpd-2.4.46/modules'
make[2]: Entering directory '/home/vagrant/httpd-2.4.46/support'
make[2]: Leaving directory '/home/vagrant/httpd-2.4.46/support'

make[1]: Leaving directory '/home/vagrant/httpd-2.4.46'
vagrant@ubuntu-focal:~/httpd-2.4.46$
```

## Install, Run, Test our Build
Following along the instructions from the Apache `httpd` page, we use the `make` utility to install the webserver as well.
```
vagrant@ubuntu-focal:~/httpd-2.4.46$ sudo make install
... lots happening 
vagrant@ubuntu-focal:~/httpd-2.4.46$ 
```
Before we run the Apache webserver, let's show that it is NOT running. (This will make more sense in a minute.) 
```
vagrant@ubuntu-focal:~/httpd-2.4.46$ ps aux | grep httpd
vagrant    83851  0.0  0.0   8160   676 pts/0    S+   23:00   0:00 grep --color=auto httpd
vagrant@ubuntu-focal:~/httpd-2.4.46$
```
The `ps` command lists all the running processes on a machine (`aux` options are needed to see everything). 
We piped the output to the `grep` program to find out if there were any processes running `httpd` (the program name of the Apache webserver). 
Try typing the `ps` command without piping its output. 
```
vagrant@ubuntu-focal:~/httpd-2.4.46$ ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  1.2 103276 12476 ?        Ss   05:32   0:05 /sbin/init
root           2  0.0  0.0      0     0 ?        S    05:32   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        I<   05:32   0:00 [rcu_gp]
... 
root       83286  0.0  0.0      0     0 ?        I    22:48   0:00 [kworker/u4:0-events_unbound]
root       83978  0.0  0.0      0     0 ?        I    23:02   0:00 [kworker/u4:1]
vagrant    83989  0.0  0.3  10616  3316 pts/0    R+   23:03   0:00 ps aux
vagrant@ubuntu-focal:~/httpd-2.4.46$
```
Now start the Apache webserver. 
```
vagrant@ubuntu-focal:~/httpd-2.4.46$ sudo /usr/local/apache2//bin/apachectl -k start
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message
```
And then use `ps` and `grep` to show the running processes. 
```
vagrant@ubuntu-focal:~/httpd-2.4.46$ ps aux | grep httpd
root       84118  0.0  0.3   6216  3940 ?        Ss   23:05   0:00 /usr/local/apache2/bin/httpd -k start
daemon     84119  0.0  0.4 1211128 4236 ?        Sl   23:05   0:00 /usr/local/apache2/bin/httpd -k start
daemon     84120  0.0  0.4 1211128 4232 ?        Sl   23:05   0:00 /usr/local/apache2/bin/httpd -k start
daemon     84121  0.0  0.4 1211128 4232 ?        Sl   23:05   0:00 /usr/local/apache2/bin/httpd -k start
vagrant    84232  0.0  0.0   8160   736 pts/0    S+   23:06   0:00 grep --color=auto httpd
vagrant@ubuntu-focal:~/httpd-2.4.46$
```
Now for the big test! Outside of your `vagrant` environment, point a browser at `http://127.0.0.1:8080/`. 
The words "It works!" should appear. 
To convince yourself, edit the text in the base httpd installation back in your `vagrant` environment (to "It still works!").
```
vagrant@ubuntu-focal:~/httpd-2.4.46$ ls /usr/local/apache2/htdocs
index.html
vagrant@ubuntu-focal:~/httpd-2.4.46$ sudo vi /usr/local/apache2/htdocs/index.html
vagrant@ubuntu-focal:~/httpd-2.4.46$
```
Back in your browser window, if your refresh, you should see the new text appear. 
At this point in history, you have now:
* Installed a virtual machine environment on your computer. 
* Configured and provisioned a Linux installation into the virtual machine environment. 
* Downloaded, built, installed, and run the Apache webserver.
* Proved it works and is running. 

So what? 

## What about that 125 years of value? 
The Apache webserver (`httpd`) is still one of the most popular Web engines after 25 years. 
According to the Net

Let's get a sense of the value that has been created in the software base that we casually built and installed by looking at a rough estimate of lines-of-code (loc) and what that represents in terms of developer value created. 

### Lines-of-code
Lines-of-code is a metric that every software developer hates and can argue against as a measure of value. 
The more software you write, the more you learn that refactoring and removing code often improves the program, rather than simply adding more code. 
One developer may express the solution to a problem in fewer lines of code which tells us nothing with respect to the relative value of the solution in terms of maintainability (readability) or algorithm choice (efficiency) or quality. 

But lines-of-code is an interesting relative measure of size. 
Assuming developers didn't write deliberately naive code to game a metric then the size of a code base is a rough measure of effort. 
If you explore the literature around software metrics, there are rules of thumb that show up when you average out a code base over a number of developers on a team, and over the period of time it took to create the code base, the values converge roughly. 
Different programming languages can solve problems in fewer lines-of-code but the ideas still hold. 

To determine the number of lines of code in Apache `httpd`, we will install and use a tool called `cloc`.

```
vagrant@ubuntu-focal:~/httpd-2.4.46$ sudo apt-get install -y cloc
Reading package lists... Done
...
vagrant@ubuntu-focal:~/httpd-2.4.46$ cloc .
    3177 text files.
    3006 unique files.
    2337 files ignored.

github.com/AlDanial/cloc v 1.82  T=3.06 s (323.3 files/s, 127700.2 lines/s)
---------------------------------------------------------------------------------------
Language                             files          blank        comment           code
---------------------------------------------------------------------------------------
C                                      314          33159          41187         192083
Bourne Shell                            25           7017           4262          47099
C/C++ Header                           175           4343          16899          12444
SVG                                      1              1              1           5877
HTML                                   249            876              9           3502
m4                                      52            444            671           3377
Lua                                     12            311            132           1924
Perl                                    13            320            570           1505
CSS                                      7            331            355           1429
make                                    69            174            227           1397
Bourne Again Shell                       3            117            211           1312
JavaScript                               2            113            553           1079
CMake                                    2            164            115           1076
Expect                                  36              0              1            787
awk                                      7             86            111            749
D                                        2              7              9            308
lex                                      1             43             64            293
Korn Shell                               3             50             70            286
YAML                                     1              6             46            264
DTD                                      6            118            121            185
yacc                                     1             34             22            161
Windows Resource File                    2             17             31            143
DAL                                      1              1              3            115
IDL                                      2              0              0            112
Markdown                                 1             12              0             28
TeX                                      1              9             45             26
Visual Basic                             1              5             13             14
Windows Module Definition                1              4              3             12
---------------------------------------------------------------------------------------
SUM:                                   990          47762          65731         277587
---------------------------------------------------------------------------------------
vagrant@ubuntu-focal:~/httpd-2.4.46$
```
### Boehm's COCOMO Model and Value
Barry Boehm's COCOMO model has been used for decades to calculate relative effort in time and staff years to create the software based on the lines-of-code. 
There are a number of sites on the Web where you can learn the about the COCOMO model that also provide calculators. (A good site is the Geek for Geeks site: https://www.geeksforgeeks.org/software-engineering-cocomo-model/.) 

1. NASA site: https://strs.grc.nasa.gov/repository/forms/cocomo-calculation/ 
1. Univeristy of Michigan calculators: http://groups.umd.umich.edu/cis/tinytools/cocomo.html 

Using any of the calculators and the 277,587 lines-of-code from `cloc` gives us a number of developers over a period of months. 
If you multiply months by developers and divide by 12, you get a number on the order of 135 years of effort. 
Using other easy cost models for engineering time, you quickly realize the value. 
Glassdoor claims the average U.S. salary of a software engineer is $120,000 per year. 
But a good rule of thumb is that the loaded cost of an employee is twice their salary (by the time you factor in benefits, holidays, training, time lost in meetings, etc.). If we use $240,000 per year and 135 years we get $32,400,000 of value. 

But this is still misleading. 
The Linux operating system we ran in our virtual machine is all open source licensed and you can 'build it from scratch' if you have the inclination. 
The software development environment (`configure`, `make`, `gcc`, `Perl`) are all open source licensed. 
Even the `vagrant` virtualization environment is open source licensed. 
In the space of this lab, you have used and built tens of millions of dollars of open source licensed software built in large vibrant communities of developers and software engineers. 

## Clean up
Let's shutdown our experiment to ensure we can start it again if we need to do so. 
We will stop the Apache webserver. Then we will exit from our virtual environment. Finally, we will shutdown the virtual machine. 
```
vagrant@ubuntu-focal:~/httpd-2.4.46$ sudo /usr/local/apache2/bin/apachectl -k stop
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message
vagrant@ubuntu-focal:~/httpd-2.4.46$ exit
logout
Connection to 127.0.0.1 closed.
$ vagrant halt
==> default: Attempting graceful shutdown of VM...
$ 
```
At this point we could use `vagrant up` the virtual machine again from this directory (with its `Vagrantfile`) and `vagrant ssh` into the machine and be right back to where we left off. 

If you use the `vagrant destroy` command, it will teardown and remove the entire virtual environment, thereby returning your diskspace to you. 
If you do this extra step, then you will need to rebuild the entire lab to get back to the state where the Apache webserver was built and ready to run. 
```
$ vagrant destroy
    default: Are you sure you want to destroy the 'default' VM? [y/N] Y
==> default: Destroying VM and associated drives...
$
```
