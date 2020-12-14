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
It is assumed the student already has `Docker` installed and running on their machine. 
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
readme.MD
$
```

Let's start the machine!
```
$ docker run -it -d -p 8080:80 ubuntu
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
da7391352a9b: Pull complete
14428a6d4bcd: Pull complete
2c2d948710f2: Pull complete
Digest: sha256:c95a8e48bf88e9849f3e0f723d9f49fa12c5a00cfc6e60d2bc99d87555295e4c
Status: Downloaded newer image for ubuntu:latest
f1eac0505442d31e4247b94242010e4347b8fadd950326c7d688594d4ac43778
$
``` 
The `docker run` command starts a container. 
We instructed it to create a container that will have an interactive, terminal connection (`-it`), run as a detached environment (`-d`), mapping the container's port 80 to our port 8080 (`-p 8080:80`), and we want to run the latest Ubuntu Linux release image. 
Looking at the output, the `ubuntu:latest` image isn't present locally, so docker reaches our to Docker Hub to copy it. 
At this point, Docker has created a virtual environment. You can view it using `docker ps -a`.
```
$ docker ps -a
CONTAINER ID   IMAGE     COMMAND       CREATED              STATUS              PORTS                  NAMES
f1eac0505442   ubuntu    "/bin/bash"   About a minute ago   Up About a minute   0.0.0.0:8080->80/tcp   vigilant_wilson
```
The container has a made up name (`vigilant_wilson` in this example) and a container ID. 
We can attach to the container and login to an interactive shell. 
```
$ docker exec -it vigilant_wilson /bin/bash
root@f1eac0505442:/#
``` 
One thing to note. The `#` symbol at the end of the prompt says this is a root-privileged shell. This means our account is all powerful, and mistakes can be costly. In the real world, we would immediately create a less privileged account on a virtual machine, and then login with that account. 
As this is a well contained lab on a well contained machine, we will live dangerously. 
Let's look around. 
```
root@f1eac0505442:/# ls -a
.  ..  .dockerenv  bin  boot  dev  etc  home  lib  lib32  lib64  libx32  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@f1eac0505442:/# cd home
root@f1eac0505442:/home# ls 
root@f1eac0505442:/home#
```
The `-a` option on the `ls` command lists all files including those that start with a `.` that would otherwise be hidden. 
We have now changed directory (`cd`) to the home directory. It is empty. 

In the Ubuntu linux world, the tool for installing and updating software is `apt`. 
It keeps track of dependencies required in a database. 
It also requires that you have super-user privilege to access the database and install the software in our limited environment.
To do this, we would preface any command requiring 'super-user' privilege with `sudo`, but in our case we have root privilege already, so we will forgoe the `sudo` in this lab. 
The `apt` and `apt-get` utilities will often prompt for a `Y` to ensure you want to install the software. 
We will use the `-y` option of the command line to force the affirmative answer. 
We will need the `curl` utility to copy a file shortly, so let's install it now. 
`curl` essentially does a copy from a remote URL using the HTTP protocol. 
Let's update our `apt` and `apt-get` database, and then install `curl`. 
```
root@f1eac0505442:/home# apt-get update
Get:1 http://security.ubuntu.com/ubuntu focal-security InRelease [109 kB]
...
Get:17 http://archive.ubuntu.com/ubuntu focal-backports/universe amd64 Packages [4248 B]
Fetched 16.6 MB in 4s (4021 kB/s)
Reading package lists... Done
root@f1eac0505442:/home# apt-get install -y curl
Reading package lists... Done
Building dependency tree
...
Processing triggers for libc-bin (2.31-0ubuntu9.1) ...
Processing triggers for ca-certificates (20201027ubuntu0.20.04.1) ...
Updating certificates in /etc/ssl/certs...
0 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.
root@f1eac0505442:/home#
```
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
root@f1eac0505442:/home/httpd-2.4.46# curl https://mirrors.gigenet.com/apache//httpd/httpd-2.4.46.tar.gz -o httpd-2.4.46.tar.gz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 9143k  100 9143k    0     0  5846k      0  0:00:01  0:00:01 --:--:-- 5846k
root@f1eac0505442:/home/httpd-2.4.46# 
```
A good habit when dealing with software from new or untrusted sites is to check the SHA256 signature to ensure the file hasn't been tampered with.
In this case, if you follow the url you will see: 
```
44b759ce932dc090c0e75c0210b4485ebf6983466fb8ca1b446c8168e1a1aec2 *httpd-2.4.46.tar.gz

```
If we run the `sha256sum` utility that comes with Ubuntu, we can compare the file we just downloaded from the Apache site with their SHA256 signature. 
```
root@f1eac0505442:/home# sha256sum httpd-2.4.46.tar.gz
44b759ce932dc090c0e75c0210b4485ebf6983466fb8ca1b446c8168e1a1aec2  httpd-2.4.46.tar.gz
root@f1eac0505442:/home#
```

## Unpacking and building Apache httpd
Let's unpack the archive. It is a gzip compressed `tar` archive (a common source compression utility and format).
Once `tar` begins you will see the verbose output listing of all the files unpacked from the archive because we used the `v` option for the extraction (`x`). 
```
root@f1eac0505442:/home# gunzip httpd-2.4.46.tar.gz
root@f1eac0505442:/home# tar xvf httpd-2.4.46.tar
... 
httpd-2.4.46/server/util.c
httpd-2.4.46/server/util_expr_parse.h
httpd-2.4.46/server/request.c
root@f1eac0505442:/home# 
```
> **Fun Historical Fact:**
> `tar` is short for *tape archive*. It is the original archiving tool for UNIX which was instantiated in POSIX.1 standard in 1988. 
> It still forms the basis for a lot of archives on the Web. It is the basis for modern container formats. 
>

Listing the files now shows the tar archive and a directory. Let's step into the directory and list the files. 
```
root@f1eac0505442:/home# ls
httpd-2.4.46  httpd-2.4.46.tar
root@f1eac0505442:/home# cd httpd-2.4.46
root@f1eac0505442:/home/httpd-2.4.46# ls
ABOUT_APACHE     CHANGES         LICENSE        README            acinclude.m4     config.layout  httpd.dep   libhttpd.dep  server
Apache-apr2.dsw  CMakeLists.txt  Makefile.in    README.cmake      ap.d             configure      httpd.dsp   libhttpd.dsp  srclib
Apache.dsw       INSTALL         Makefile.win   README.platforms  apache_probes.d  configure.in   httpd.mak   libhttpd.mak  support
BuildAll.dsp     InstallBin.dsp  NOTICE         ROADMAP           build            docs           httpd.spec  modules       test
BuildBin.dsp     LAYOUT          NWGNUmakefile  VERSIONING        buildconf        emacs-style    include     os
root@f1eac0505442:/home/httpd-2.4.46# 
```
There is an array of files. From long experience I know there are multiple build files for multiple operating systems. 
It is probably a good moment to go back to the 'instuctions'. 
The [**Requirements**](https://httpd.apache.org/docs/current/install.html#requirements) section on the Installation page contains a reference to a list of software that you will need to build Apache.

The list of things for us to install according to the [**Requirements**](https://httpd.apache.org/docs/current/install.html#requirements) section looks like the following. 
(There will be lots of output after each install.)
```
root@f1eac0505442:/home/httpd-2.4.46# apt install -y make
root@f1eac0505442:/home/httpd-2.4.46# apt install -y make-guile
root@f1eac0505442:/home/httpd-2.4.46# apt install -y gcc
root@f1eac0505442:/home/httpd-2.4.46# apt-get install -y libapr1 libapr1-dev   # APR 
root@f1eac0505442:/home/httpd-2.4.46# apt-get install APR-util                 # and APR-util
root@f1eac0505442:/home/httpd-2.4.46# apt-get install -y apache2-dev           # because apparently as you tease it apart we still need this.
#
# This step will ask two questions for you to set your TZ appropriately by country and region. 
#
root@f1eac0505442:/home/httpd-2.4.46# apt-get install -y libpcre3 libpcre3-dev # PCRE
```
Our machine provisioning installed ntp (Network Time Protocol) and you can confirm you have an appropriate version of Perl by asking for the version.
```
root@f1eac0505442:/home/httpd-2.4.46# perl --version

This is perl 5, version 30, subversion 0 (v5.30.0) built for x86_64-linux-gnu-thread-multi
(with 50 registered patches, see perl -V for more detail)

Copyright 1987-2019, Larry Wall

Perl may be copied only under the terms of either the Artistic License or the
GNU General Public License, which may be found in the Perl 5 source kit.

Complete documentation for Perl, including FAQ lists, should be found on
this system using "man perl" or "perldoc perl".  If you have access to the
Internet, point your browser at http://www.perl.org/, the Perl Home Page.

root@f1eac0505442:/home/httpd-2.4.46#
```
Now we will use the `configure` script and `make` utility to build the world. 
This is often the first place of real trial and error. 
If there is a configure script, then the software has likely been built on a lot of different platforms, which *should* be helpful.
There are still holes. 
For example, as I read the instructions and tried the configure script, some things still required a little extra searching on the Web.
(A good example is the need for the installation of `apache2-dev` above.)
```
root@f1eac0505442:/home/httpd-2.4.46# ./configure
... lots of output
root@f1eac0505442:/home/httpd-2.4.46# make
... lots more output
/usr/share/apr-1.0/build/libtool --silent --mode=link x86_64-linux-gnu-gcc  -pthread           -o mod_rewrite.la -rpath /usr/local/apache2/modules -module -avoid-version  mod_rewrite.lo
make[4]: Leaving directory '/home/vagrant/httpd-2.4.46/modules/mappers'
make[3]: Leaving directory '/home/vagrant/httpd-2.4.46/modules/mappers'
make[2]: Leaving directory '/home/vagrant/httpd-2.4.46/modules'
make[2]: Entering directory '/home/vagrant/httpd-2.4.46/support'
make[2]: Leaving directory '/home/vagrant/httpd-2.4.46/support'

make[1]: Leaving directory '/home/vagrant/httpd-2.4.46'
root@f1eac0505442:/home/httpd-2.4.46#
```

## Install, Run, Test our Build
Following along the instructions from the Apache `httpd` page, we use the `make` utility to install the webserver as well.
```
root@f1eac0505442:/home/httpd-2.4.46# make install
... lots happening 
root@f1eac0505442:/home/httpd-2.4.46# 
```
Before we run the Apache webserver, let's show that it is NOT running. (This will make more sense in a minute.) 
We will use the `ps` command to show us all the running processes in our virtual environment, and pipe the output to the `grep` command looking for the string `httpd` which is the name of the webserver. We should see that the only command running with that string is the `grep` command itself. 
```
root@f1eac0505442:/home/httpd-2.4.46# ps aux | grep httpd
vagrant    83851  0.0  0.0   8160   676 pts/0    S+   23:00   0:00 grep --color=auto httpd
root@f1eac0505442:/home/httpd-2.4.46#
```
The `ps` command lists all the running processes on a machine (`aux` options are needed to see everything). 
We piped the output to the `grep` program to find out if there were any processes running `httpd` (the program name of the Apache webserver). 
Try typing the `ps` command without piping its output. 
```
root@f1eac0505442:/home/httpd-2.4.46# ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  1.2 103276 12476 ?        Ss   05:32   0:05 /sbin/init
root           2  0.0  0.0      0     0 ?        S    05:32   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        I<   05:32   0:00 [rcu_gp]
... 
root       83286  0.0  0.0      0     0 ?        I    22:48   0:00 [kworker/u4:0-events_unbound]
root       83978  0.0  0.0      0     0 ?        I    23:02   0:00 [kworker/u4:1]
vagrant    83989  0.0  0.3  10616  3316 pts/0    R+   23:03   0:00 ps aux
root@f1eac0505442:/home/httpd-2.4.46#
```
Now start the Apache webserver. 
```
root@f1eac0505442:/home/httpd-2.4.46# /usr/local/apache2//bin/apachectl -k start
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message
```
And then use `ps` and `grep` to show the running processes. 
```
root@f1eac0505442:/home/httpd-2.4.46# ps aux | grep httpd
root       84118  0.0  0.3   6216  3940 ?        Ss   23:05   0:00 /usr/local/apache2/bin/httpd -k start
daemon     84119  0.0  0.4 1211128 4236 ?        Sl   23:05   0:00 /usr/local/apache2/bin/httpd -k start
daemon     84120  0.0  0.4 1211128 4232 ?        Sl   23:05   0:00 /usr/local/apache2/bin/httpd -k start
daemon     84121  0.0  0.4 1211128 4232 ?        Sl   23:05   0:00 /usr/local/apache2/bin/httpd -k start
vagrant    84232  0.0  0.0   8160   736 pts/0    S+   23:06   0:00 grep --color=auto httpd
root@f1eac0505442:/home/httpd-2.4.46#
```
Now for the big test! Outside of your `docker` environment, point a browser at `http://127.0.0.1:8080/`. 
The words "It works!" should appear in the browser window. 
To convince yourself that this is coming from the virtualized environment, 
we will overwrite the text in the base httpd installation back in your `docker` environment (to "It still works!").
We will do this by overwriting text with the `echo` command onto the initially displayed file. 
```
root@f1eac0505442:/home/httpd-2.4.46# cat /usr/local/apache2/htdocs/index.html
<html><body><h1>It works!</h1></body></html>
root@f1eac0505442:/home/httpd-2.4.46# echo '<html><body><h1>It still works!</h1></body></html>' >/usr/local/apache2/htdocs/index.html
root@f1eac0505442:/home/httpd-2.4.46# cat /usr/local/apache2/htdocs/index.html
<html><body><h1>It still works!</h1></body></html>
root@f1eac0505442:/home/httpd-2.4.46#
```
Back in your browser window, if your refresh, you should see the new text appear. 
At this point in history, you have now:
* Installed a virtual machine environment on your computer. 
* Configured and provisioned a Linux installation into the virtual machine environment. 
* Downloaded, built, installed, and run the Apache webserver.
* Proved it works and is running. 

So what? 

## What about that 125 years of value? 
The Apache webserver (`httpd`) is still one of the most popular Web engines after 25 years. (It powers [almost a third](https://news.netcraft.com/archives/category/web-server-survey/#:~:text=nginx%20also%20maintains%20its%20lead,of%20active%20sites%20(25.9%25).) of the websites worldwide according to the [NetCraft survey](https://news.netcraft.com/archives/category/web-server-survey/).)

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
root@f1eac0505442:/home/httpd-2.4.46# apt-get install -y cloc
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
root@f1eac0505442:/home/httpd-2.4.46#
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
The Linux operating system we ran in our virtual machine is all open source licensed and you can '[build it from scratch](http://www.linuxfromscratch.org/)' if you have the inclination. 
The software development environment (`configure`, `make`, `gcc`, `Perl`) are all open source licensed. 
Even the `docker` virtualization environment is open source licensed. 
In the space of this lab, you have used and built tens of millions of dollars of open source licensed software built in large vibrant communities of developers and software engineers. All of it freely available to use. 

## Clean up
Let's shutdown our experiment to ensure we can start it again if we need to do so. 
We will stop the Apache webserver. Then we will exit from our virtual environment. Finally, we will shutdown the virtual machine. 
```
root@f1eac0505442:/home/httpd-2.4.46# /usr/local/apache2/bin/apachectl -k stop
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message
root@f1eac0505442:/home/httpd-2.4.46# exit
exit
1$

```
At this point we are clear of the container environment. 
The container is still running. You can see it with the `docker ps` command. 
You can re-connect to the running container by re-executing the `docker exec` command. 
You can stop the container with a `docker stop` command with the name of the container. 
```
1$ docker ps -a
CONTAINER ID   IMAGE     COMMAND       CREATED             STATUS             PORTS                  NAMES
f1eac0505442   ubuntu    "/bin/bash"   About an hour ago   Up About an hour   0.0.0.0:8080->80/tcp   vigilant_wilson
1$ docker exec -it vigilant_wilson  /bin/bash
root@f1eac0505442:/# cd home
root@f1eac0505442:/home# ls
httpd-2.4.46  httpd-2.4.46.tar
root@f1eac0505442:/home# exit
exit
1$ docker stop vigilant_wilson
vigilant_wilson
1$ docker ps -a
CONTAINER ID   IMAGE     COMMAND       CREATED             STATUS                     PORTS     NAMES
f1eac0505442   ubuntu    "/bin/bash"   About an hour ago   Exited (0) 5 seconds ago             vigilant_wilson
1$
```
