# Lab 2: Evaluating Projects 
In Lesson 3 we took a look at activities that maintainers of OSI-licensed software projects could do to build on-ramps to engage users, 
developers, and contributors to the project. 
In Lab 1, we built the Apache webserver from source, following along from a 'found' web page in the project's website. 
In this lab, we will use the activities list to test build another project (from a list), evaluating the projects (and the activity list). 

## Objectives
* Evaluate the experience of downloading and **building** another open source licensed software project from a short list of projects. 
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
If you are working with a partner, you only need to email ONE report for both students. 
* Your name and email. (Make sure both names and email addresses are on the report if you are working with a partner.) 
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
1. Building the Project from Source: Are there good instructions for how to build the project? (URL?) How did your build go? 
1. Testing to a Known State: Is there a test suite and a way to test the build? (URL?)
1. Design or Architectural Documentation: Did there appear to be architectural documentation of any kind? A design document? 
1. Project Communications: Could you find an IRC/Slack channel, any email distribution lists, or forums? 
(You do not have to join them. If you found a URL/page describing available channels, include it.) 
1. The Project Mission: Is there a mission statement for the project? (List URL.) 
1. Code-of-Conduct: Is there a code of conduct? (List URL.) 
1. Contributions: Could you find getting involved instructions or contribution guidelines? (You know the drill: list the URL.)
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
(e.g., Perl has https://www.perl.org/ as well as https://www.cpan.org/ for all of the Perl language plug-ins and the Perl source, 
and they also have a GitHub site https://github.com/Perl/perl5). 


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
At this point, you have a basic Ubuntu machine on which to test build the project, you are logged into it.
As you build the softfware, you may indeed encounter other dependencies for tools. 
You can use `apt-get` to pull any other tooling you might need. (You might even note it in the report.) 

### Example Report ### 

> Student-Name
>
> Student-Email
>
> Project I am evaluating: Node
> 
> Project Website: https://nodejs.org/en/
> 
> Project License: https://opensource.org/licenses/MIT (license which all node.js src originating from the node repo)
>   full license including external libraries is found here https://github.com/nodejs/node/blob/master/LICENSE
> 
> Introductory Documents: There is a comprehensive Getting Started documentation for Node.js which can be found at this link: https://nodejs.org/en/docs/guides/getting-started-guide/.
> This guide seems to walk users through everything, from installation to the nuances of the source code and any potential uses a user may have for it.
> I also found the api documentation at this link: https://nodejs.org/api/. This documentation describes built-in modules provided by Node.js
> (it doesn't include any modules provided by community). The Node.js website also provides api documentation for each of the different versions
> of Node.js which is very useful for people who are running older versions of the source code (great for ensuring overall documentation of all
> versions users, developers, and contributors may be using). Here is also a list of a complication of any helpful documentations someone may need (https://nodejs.org/en/docs/guides/)
> 
> FAQs: There is not a specific FAQ page associated with this project. Though at this url you may find a list of methods to get involved with community discussions
>  (https://nodejs.org/en/get-involved/)
> 
> User Installation: Users are able to install the project without building from the source by downloading a file from this url: https://nodejs.org/en/download/
> The platforms that are supported are: Windows, macOS, Linux, SmartOS, Docker, and AIX on Power Systems.
> 
> Installer Support: I am currently running macOS. The Node.js website has a macOS installer I can download directly from the website. I can also use
> Homebrew, MacPorts, and pkgsrc as alternative installers.
> 
> Bugtracking/Issues: Issues tracking can be found here: https://github.com/nodejs/node/issues
> 
> How-to: This document details how to report an issue with the code: https://github.com/nodejs/node/blob/master/doc/guides/contributing/issues.md#submitting-a-bug-report
> 
> Source Availability: Complete source code was extremely easy to download and find after a simple search (located here: https://github.com/nodejs/node)
> 
> Building the Project from Source: There are comprehensive instructions on how to build the project from src for all supported platforms
> located here: https://github.com/nodejs/node/blob/master/BUILDING.md.
> 
> Testing to a Known State: There is a test directory (https://github.com/nodejs/node/tree/master/test) and in the instructions on how to build
> the project from source they also tell a user how to run the test suit.
> 
> Design or Architectural Documentation: There did not seem to be a design documentation
> 
> Project Communications: I was able to find the page that had links for associated community discussions (https://nodejs.org/en/get-involved/).
> On this page there were links to access the community Slack and IRC. There are a handful of other avenues through which someone can interact with
> Node.js managers and the community to have their questions or concerns addressed.
> 
> Project Mission: There is not an outright mission statement for the project but there is an About page on the project website detailing what Node.js
> is and why it has been created (https://nodejs.org/en/about/).
> 
> Code-of-Conduct: Code of conduct document in the github https://github.com/nodejs/admin/blob/master/CODE_OF_CONDUCT.md. There is also a page on the project
> website about the code of conduct of the project https://github.com/nodejs/node/blob/master/doc/guides/contributing/code-of-conduct.md (this is a link to a different
> code of conduct document in the github).
> 
> Contributions: This website on the project page talks about how to get started when contributing to the project (https://nodejs.org/en/get-involved/contribute/)
> There is also a Contrubtions document in the github repo further outlining how to contribute (https://github.com/nodejs/node/blob/master/CONTRIBUTING.md#pull-requests)
> 
> Meet-ups and Learning Forums: This is a list of events that people can attend to get started or continue contributing to the project(https://nodejs.org/en/get-involved/code-and-learn/).
> There is also a collaboration summit listed on their website: https://nodejs.org/en/get-involved/collab-summit/. There is also a detailed list of links to meetups
> based on geographical location and the code base for these groups (https://nodejs.org/en/get-involved/node-meetups/).
> 
> Source Code Base: I was unable to finish the build after waiting for 3 hours to complete.
> 
> My Evaluation: Overall the experience looking through the Node.js documentation was fairly easy. Finding the website and the github repo took a simple search and all of the
> information was smartly organized that allowed for navigating with ease. Downloading the sourcecode for the project was quite large so it did take some time (especially any
> other implicit installations that took place), but by using the installers the project was very easy to download. Overall, I have a very positive perspective of the project
> and their compliance with the open source guidelines to ensure and promote software and community development.
> 
> 
> TRIAL BUILDS:
> I was unable to finish the build after waiting for 3 hours to complete. Because of this I am unable to determine whether the build instructions for the source
> code ran successfully or not. 



