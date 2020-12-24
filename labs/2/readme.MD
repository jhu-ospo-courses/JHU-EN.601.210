# Lab 2: Evaluating Projects 
In Lesson 3 we took a look at activities that maintainers of OSI-licensed software projects could do to build on-ramps to engage users, 
developers, and contributors to the project. 
In Lab 1, we built the Apache webserver from source, following along from a 'found' web page in the project's website. 
In this lab, we will use the activities list to test a couple of other projects, evaluating the projects (and the activity list). 

## Objectives
* Download and build another open source licensed software project from a short list of projects.
* Evaluate the experience, and evaluate the experience against the list of activities. 
* Use a couple of other Web resources to further explore the project. 
* Report on the experience and report on the project versus the criteria list.

## Instructions
We are going to treat this as the technical challenge in the Great British Bake-off. 
There will be broad instructions and some clues along the way, but you are pretty much doing the work without a lot of hand holding.
Unlike the Bake-off, you are welcome to work together, 
and I'm available to answer questions. 
Your goal is to produce a simple report that lists the project, your build experience, and evaluates the project you chose against the criteria. 

There is an example of the simple report at the end of this Lab. 
We are going to use a more simplified list of activities. 
I do not expect students to be investigating or evaluating complex build environments for contributors. 

Choose one of the following projects. 
1. Perl, a foundational scripting language for systems administration and building (early) dynamic web sites. 
1. Python, an important programming language in the scientific, machine learning, and research community (and other places). 
1. Node, a programming environment for server-side javascript programming. 
1. Semester.ly, tooling used by students at Johns Hopkins and other universities to track their courses with classmates in a web-based service. 

Similar to Lab 1, start a clean containerized environment in which you will explore the project. 
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
Get the name of the container using `docker ps -a`.
```
$ docker ps -a
CONTAINER ID   IMAGE     COMMAND       CREATED              STATUS              PORTS                  NAMES
f1eac0505442   ubuntu    "/bin/bash"   About a minute ago   Up About a minute   0.0.0.0:8080->80/tcp   vigilant_wilson
```
The container has a made up name (`vigilant_wilson` in this example) and a container ID. 
Attach to the container and login to an interactive shell. 
```
$ docker exec -it vigilant_wilson /bin/bash
root@f1eac0505442:/#
``` 
Remember, when you see a `#` symbol at the end of the prompt, this is a root-privileged shell. Your account is all powerful, and mistakes can be costly. 
In the real world, we would immediately create a less privileged account on a virtual machine, and then login with that account.  
```
root@f1eac0505442:/# ls -a
.  ..  .dockerenv  bin  boot  dev  etc  home  lib  lib32  lib64  libx32  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@f1eac0505442:/# cd home
root@f1eac0505442:/home# ls 
root@f1eac0505442:/home#
```
We are back in the empty home directory, ready to begin. 
Let's setup the environment for building software with the tools we will likely need using `apt`.
You can list multiple packages on the `apt` command line, forcing acceptance with a `-y` option. 
First we will update our `apt` database. 
```
root@f1eac0505442:/home# apt-get update
Get:1 http://security.ubuntu.com/ubuntu focal-security InRelease [109 kB]
...
Get:17 http://archive.ubuntu.com/ubuntu focal-backports/universe amd64 Packages [4248 B]
Fetched 16.6 MB in 4s (4021 kB/s)
Reading package lists... Done
root@f1eac0505442:/home# apt-get install -y curl gcc make cloc
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

