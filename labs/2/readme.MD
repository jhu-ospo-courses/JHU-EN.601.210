# Lab 2: Evaluating Projects 
In Lesson 3 we took a look at activities that maintainers of OSI-licensed software projects could do to build on-ramps to engage users, 
developers, and contributors to the project. 
In Lab 1, we built the Apache webserver from source, following along from a 'found' web page in the project's website. 
In this lab, we will use the activities list to test a couple of other projects, evaluating the projects (and the activity list). 

## Objectives
* Evaluate the experience of downloading and building another open source licensed software project from a short list of projects. 
* Report on the experience using the criteria from Lesson 3. 

## Instructions
We are going to treat this as the technical challenge in the Great British Bake-off. 
There will be broad instructions and some clues along the way, but you are pretty much doing the work without a lot of hand holding.
Unlike the Bake-off, you are welcome to work together, 
and I'm available to answer questions. 
Your goal is to produce a simple report that lists the project, your build experience, and evaluates the project you chose against the criteria. 

We are going to use a more simplified list of activities. 
I do not expect students to be investigating or evaluating complex build environments for contributors. 

**Choose one of the following projects.**
1. Perl, a foundational scripting language for systems administration and building (early) dynamic web sites. 
1. Python, an important programming language in the scientific, machine learning, and research community (and other places). 
1. Node, a programming environment for server-side javascript programming. 
1. Semester.ly, tooling used by students at Johns Hopkins and other universities to track their courses with classmates in a web-based service. 


### The Report
The report for your exploration should itemize the following. 
* Your name 
* The name of the project you are evaluating
* Answer the following questions:
1. Project Website: Provide a URL to the project website. 
1. Project License: Provide a URL to the project license.
1. Introductory Documents: Were there getting started documents or tutorials? (Provide any URLs.) 
1. FAQ: Was there an FAQ? (Provide the URL if you found one.)
1. User Installation: Does it look like you can install the project executables without building the project from source? (URL?) What platforms are supported? 
1. Installer Support: What was the installer for your platform? (For example, is there a brew installer for Mac OS?)
1. Bugtracking/Issues: Does it look like there is bugtracking or issue tracking available? (URL?)
1. How-to: Are there instructions for how to file a bug/issue for the project? 
1. Source Availability: Was complete source published and easy to find/download? (URL?) 
1. Building the Project from Source: Are there good instructions for how to build the project? (URL?) 
1. Testing to a Known State: Is there a test suite and a way to test the build? (URL?)
1. Design or Architectural Documentation: Did there appear to be architectural documentation of any kind? A design document? 
1. Project Communications: Could you find an IRC/Slack channel, any email distribution lists, or forums? 
(You do not have to join them. If you found a URL/page describing available channels, include it.) 
1. The Project Mission: Is there a mission statement for the project? (List URL.) 
1. Code-of-Conduct: Is there a code of conduct? (List URL.) 
1. Contributions: Could you find getting involved instructions or contribution guidelines? 
1. Meet-ups and Learning Forums: Can you find reference to any conferences or meet-ups for the project?
1. Source Code Base: Use `cloc` to determine how big the source code base is. 
1. Your Evaluation: In purely subjective terms, how did you find the whole experience? 

Email it to me at swalli1 at jh.edu when you are finished. 
If you worked with anyone else, please include everyone's name on a single report. 

### The Investigation
The search engine is your friend. 
Trying simple explicit searches is best. For example:
1. `<project name> open source`
1. `build <project name> from source`
1. `<project name> license`
1. `<project name> meetup`

While many mature projects have moved to [GitHub](http://www.github.com) from their original forge sites, 
they often maintain project sites as well as GitHub sites. 
Some projects pre-date GitHub and have their own rich sites 
(e.g., Perl has https://www.perl.org/ as well as https://www.cpan.org/ for all of the Perl language plug-ins). 


### Trial Builds
You are expected to follow the build instructions (once found) to see if the instructions are accurate.
If your build fails at any step in the instructions, then note that failure in your report. 
Did the build seem to succeed but the testing failed? Note that appropriately. 
Were you able to still partially build and install? 

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


