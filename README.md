# JHU-EN.601.210
## Choose Your Own Open Source Software Adventure
Open source software is the foundation on which the Internet and the Web are built, and the tooling with which software is developed in a modern world. Projects like the Linux kernel, the Python and Rust programming languages, and the Firefox browser are all open source. But what is it, and how does one get involved? This course introduces students to the basic ideas around open source software, why it is a perfect space in which to learn software engineering skills, and allows a student to engage in the broad open source project world for fun and profit. 

## Long Description 
The open source definition was set down in 1998 but developers have been collaborating on software since they began writing software all the way back into the 1950s. Today, the modern Internet runs on open source software, and it forms the backbone of the modern web, cloud computing, AI/ML, and all programming languages and tools. Tens of billions of dollars of software value has been created in collaborative open source licensed projects. This intersession course will introduce students to the ideas behind open source, but more importantly expose them to the development of software at scale, and software engineering concepts that are prevalent in large open source projects. 

Open source software serves computer science students in several ways. Software engineering skills, developing software in a collaborative setting, and then deploying it at scale, are valuable skills that computer programmers need to succeed. Likewise, evaluating open source licensed software for use in the programmer’s own projects, research, and work ensures they choose the best tools for the job at hand. Lastly, one of the best ways to learn new skills and languages is to read examples of well-written programs and being able to evaluate an open source project provides a wealth of opportunities for students to learn. 
The intersession course will teach students how open source licensed collaborative projects work from an engineering and economics perspective, how to use it in their future projects, and how to engage in projects to their own benefit. The in-class labs provide hands-on experience backed with lectures on principles and practices in this rich software world. 

## Prerequisites  
Intermediate Programming (601.220). Students should have a simple familiarity with the Linux command line and simple git commands. (Prior to the class, students are most likely familiar with classes that used Java and or Python for assignments.) 

## Learning Objectives 
By the end of the course, students will:
* Understand how liberally licensed, collaboratively developed software fits into the world of a professional programmer and researcher. 
* Be able to identify healthy open source projects and tools they can use in their projects and research without compromising their work. 
* Have an approach to download, build, and use an open source project, and make modifications for their own use. 
* Understand the difference between programming in the small, and the tooling and process to support software engineering at scale. 

All of the objectives of individual lessons and labs are collected together [here](https://github.com/jhu-ospo-courses/JHU-EN.601.210/blob/main/objectives.md). 
   
## Course Topics (Lessons)
1. A brief history of software collaboration from 1950 to 2020. 
1. What IS open source software? (The engineering economics of collaboration.)
1. What healthy open source software projects look like. (On ramps and selfishness.)
1. No scale without discipline (Software engineering 101)
1. What is this madness called licensing and why you might care (a little).
1. Scaling up even more (The role of non-profits in an open source enabled world)
1. Governance is not what you think it is (Why voting is problematic and engineers hum in the Internet Engineering Task Force)
1. Codes of conduct, bad behavior, diversity, and other bits of social science.
1. Why your open source software startup will fail.

## Labs
1. How to build 125 years worth of software value in an afternoon
1. Evaluating open source licensed projects

## Getting Started
This course is meant to be copied into your working directories with `git clone`. 
Then you can follow along either from the Github site or from your cloned project. 

Each Lesson will be presented, and follows the outline in the lesson notes for the lesson number. 
All relevant files for a lesson are in the directory named for the lesson number. 
All files needed for a lab (that aren't downloaded as part of the lab) are in the directory named for the lab number. 
Labs have instructions and tie back to lessons. 
There may be references in the labs to specific lesson notes, and vice versa. 

As explained in Lab section, you are expected to have `Docker` installed on your machine.
All instructions are based on the Linux command line. (Simple familiarity with `bash`, `sh`, `ksh` all works. We will not be programming in the shell.) 
You will need to have `git` installed. Again, please see [Setting up for Labs](https://github.com/stephenrwalli/JHU-EN.601.210/tree/main/labs#setting-up-for-labs). 

Assuming you are in your home directory, you may choose to clone this repo following the instruction below. 
(If you organize your directories differently, you should be able to change directory and clone the repo into a different place.)

> The shell command prompt in examples is generally shown as a `$`, sometimes with a machine+directory identifier (e.g. `MacBook-Pro labs$`).
> Expected output then follows (possibly truncated with `...` if there is a lot of output). 
> You are expected to type what follows the `$`, hitting a `<RETURN>` key at the end of the command.
> In the following example, you will type `git clone https://github.com/stephenrwalli/JHU-EN.601.210.git<RETURN>`, see the displayed output, 
> then type `ls<RETURN>`. 

```
$ git clone https://github.com/stephenrwalli/JHU-EN.601.210.git
Cloning into 'JHU-EN.601.210'...
remote: Enumerating objects: 62, done.
remote: Counting objects: 100% (62/62), done.
remote: Compressing objects: 100% (53/53), done.
remote: Total 62 (delta 7), reused 11 (delta 0), pack-reused 0
Receiving objects: 100% (62/62), 28.69 KiB | 103.00 KiB/s, done.
Resolving deltas: 100% (7/7), done.
stephenrwalli@Stephens-MacBook-Pro Projects$ cd JHU-EN.601.210/
$ ls
LICENSE   README.md labs      lessons
$
```



