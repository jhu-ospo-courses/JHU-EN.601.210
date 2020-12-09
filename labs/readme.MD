# Setting up for Labs

## Technology
I imagine students have a myriad of machines. From that perspective we are going to set up a simplified virtual machine environment using VirtualBox and Vagrant. 
VirtualBox is free virtualization technology from Oracle and can be downloaded from here: https://www.virtualbox.org/wiki/Downloads. 

Vagrant is free technology available from Hashicorp for defining virtual machines ('boxes' in Vagrant-speak) and can be downloaded from here: https://www.vagrantup.com/. 

Creating a virtual machine means creating disk space and memory on your regular student machine that will be used to run a new smaller computer 'virtually.' 
This is the same technology that allows you to organize a very large server into many smaller virtual servers to distribute workloads and isolate them from one another. 
Once you log on to that virtual machine (the Vagrant box), everyone will be looking at the same environment for labs. 

It is important to remember that virtual machines still take up disk space when they are not running, and memory as well when they are running. 
If you experiment with too many virtual machine images, you may discover you run out of space for all the other files and apps you want to run. 

Additionally you will need a UNIX-like command line environment on your computer. 
If you are running a Mac, then you can use a tool like iTerm (available here): https://iterm2.com/ 
On a Windows machine, you can use WSL2, which provides a Linux environment (available here): https://docs.microsoft.com/en-us/windows/wsl/install-win10

Lastly, having `git` installed will make things easier for labs as you can clone the exercise files directly instead of creating them. 
The 'git' version control tools are available from here: https://git-scm.com/downloads

Once the course is over, you will likely want to clean up all the disk space used in the labs for EN.601.210. 
