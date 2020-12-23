# The Engineering Economics of Open Source Software (or why we do what we do)

## Objectives
* Understand the engineering economics of consuming OSI-licensed projects into one's own software projects.
* Understand the imperative of engineering contributing back when one consumes OSI-licensed projects. 
* Understand something of the dynamic nature of software. 

## Notes

In Lesson 1, we saw that open source is a licensing hack on copyright law to enable developers to collaborate on and share software as they had been doing from the beginning of the creation of software. 
This lesson we will go into more of the details of the economics of why open source software collaboration is compelling. 

Every product manager and development manager in the software world understands a simple engineering trade-off: build versus buy. 
Do you build the software you need from scratch, or do you buy it (or license it) for use in the overall solution you are building? 
Looking at the COCOMO model in Lab #1 it becomes pretty clear that the creation of complex software is costly. 
Recognize as well that no software once released remains unchanged. 
Indeed software is amazingly dynamic, therefore the ongoing maintenance of a body of code is equally costly. 

Open source changes the build versus buy trade-off by adding the idea that there are interesting buckets of software technology from which you can borrow and share. 
Let's look at an example in some detail that demonstrates the economics. 
But first let's consider our measurement systems around lines-of-code and Boehm's COCOMO model. 

### Lines-of-code
Lines-of-code is a metric that every software developer hates and can argue against as a measure of value. The more software you write, the more you learn that refactoring and removing code often improves the program, rather than simply adding more code. One developer may express the solution to a problem in fewer lines of code which tells us nothing with respect to the relative value of the solution in terms of maintainability (readability) or algorithm choice (efficiency) or quality.

But lines-of-code is an interesting relative measure of size. Assuming developers didn't write deliberately naive code to game a metric then the size of a code base is a rough measure of effort. If you explore the literature around software metrics, there are rules of thumb that show up when you average out a code base over a number of developers on a team, and over the period of time it took to create the code base, the values converge roughly. Different programming languages can solve problems in fewer lines-of-code but the ideas still hold.

### Boehm & the COCOMO Model & Value
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

### A Real Life Example 
Interix was a product in the late 1990s that provided the UNIX interface on Microsoft Windows NT. 
The product encompassed approximately 300 software packages covered by roughly 25 licenses, plus a derivative of the Microsoft POSIX subsystem, 
plus the additional software written by the Interix engineers. 
(This work pre-dates the open source definition.) 
The engineering team started with the 4.4BSD-Lite distro from UC Berkeley as the basis of the UNIX commands and utilities. 
All of the programs were written in the C language and the product team were using the Microsoft C compiler.
This was a period of history when Windows NT ran on multiple computer architectures (Intel x86, DEC Alpha, MIPS), 
and so one needed a compiler that would run on all three architectures. 

Within a couple of years, the team needed more control of their compiler environment. 
This is not uncommom when working at the systems level for certain classes of problems. 
For example, 
Google created the Go language as a compiler environment they could control in their software engineering environment supporting their complex application base.
DEC and Intel each sold expensive compilers, and presumably one could find a MIPS C compiler as well. 
Buying compiler software to support the Interix build environment would become expensive quickly and the company was a venture backed startup. 
Likewise, building a C-language compiler would be unrealistic for the team as they were working to deliver product quickly in a startup environment. 
The OSI-licensed GNU C-compiler suite (`gcc`), however, could provide critical support for the Interix tool chain, 
and be the basis for a software development kit (SDK) to enable customers to port their own UNIX application base to Interix on Windows NT.

This is the basis of the build versus buy versus borrow-and-share decision. 
It took a senior compiler developer on the order of 6–8 months to port `gcc` into the Interix environment. 
It was a little more work when you include testing and integration, etc., so round it up to on the order of $100K (in 1997 dollars). 
The `gcc` suite was about 750K lines of code in those days, 
which the COCOMO calculation suggests was worth $10M-$20M worth of value depending on the multiplier used for how much folks were earning. 
That’s roughly two orders of magnitude in cost savings instead of writing a bad compiler suite from scratch and the length of time to deliver that work. 
In those days, the venture capitalists had invested $2M in the company, so building a compiler wasn't in the plan. 
Licensing compilers from chip manufacturers would cost on the order of $100K on each architecture, 
and the Interix team would still be at the mercy of those other companies for maintenance and the cost of support. 
The GNU C-compiler suite was a well-maintained, robust, hardened compiler suite, which included C++ and Fortran77 compiler front ends, and a debugger. 

Porting the GNU C-compiler suite solved the compiler problem, but now the Interix the Interix engineering team were living on a fork. 
This means they were drifting further away from the functionality and fixes on the mainline of the tree, 
which was being actively worked on by the compiler specialists in the `gcc` community.
The back of the envelop estimate suggested that every new major revision of `gcc` would cost the Intereix team another 6+ month engineering cycle to re-integrate. 
If on the otherhand, the team could get there changes contributed back into the mainline code base, 
it would reduce integration time to on the order of a month of testing. 
From ~$100K cost of 6-8 month engineering cycle, a one month cycle is approaching $10K-$20K. 
This means maintaining $10M-$20M of software value on a one month $10K-$20K integration cycle from our expert by not living on a fork. 

The Interix team worked to integrate their changes back, and also hired a specialist company that had `gcc` maintainers on staff, 
to get all the Interix changes back into the mainline `gcc` tree. 
Indeed, there were two specialist companies from which the Interix engineering team could choose with different strengths. 
This cost another approximately $50K as a one time charge. 
But understand that the GNU C-compiler suite was not standing still. 
In the two years over which the work and its integration happened, the `gcc` code base grew from 750K lines of code to 1.2M. 
The value of the project was growing. 

Realize that the Interix engineering team wasn’t contributing back out of altruism. It was engineering economics. 
It was the right thing to do, not just because of the dollar and time economics, 
but because the team was contributing back to the hardening of the compiler suite they were themselves using. 
No company can hire all the best developers in a particular technology area.
The the Interix compiler expert was getting the benefit of the breadth of the industry while themselves contributing. 

That is the engineerig economic benefit of the borrow-and-share option. 
You can see a similar net return on the 10% year-on-year investment Red Hat makes on their Linux kernel contributions as they deliver complete Linux distros with Fedora and Red Hat Enterprise Linux. 

This particular example gives one an insight into how to think about using OSI-licensed project components in large scale projects, 
and how to think about the large dollar cost engineering trade-offs. 
Interestingly, the economics works in the small as well. 
In the first lab, the Apache webserver is built from scratch. 
One can see the enormous value captured in the calculation of what it would take to write the complex webserver from scratch. 
As a user of the webserver, one captures the value directly and cleanly. 
As a developer, you could extend the webserver, or fix a bug you may discover. 
The cost of that extension or bug fix pales in comparison to the value captured having an entire webserver at your disposal.
You can further cost out buying a webserver service, where you have no control, but ease of use to compare against hosting your own. 

Or consider the economics from a research perspective. 
A research project may require certain basic building blocks as a foundation on which the research will be built. 
Those building blocks may require changes at the source code level, but having a rich collection of blocks from which to start changes the game. 
Contributing those changes back upstream to the open source project means the research foundation has long term viability for others to build on it. 

Even at a very personal level, I would argue that individual developers can value their skill sets differently in an open source enabled world. 
Having one's name on key contribution streams in an open source community world is some of the best advertising 
and resumé content one can provide as a developer on your ability:
* to get work done, 
* to work in a collaborative engineering setting, 
* to demonstrate your understanding of a technology base. 

The connections you make in a community around such work further expands your network when job hunting. 
Reading software is a good way to improve one's skills, so reading known good software projects is an opportunity to improve one's skills. 

**All of this assumes of course that we are talking about healthy OSI-licensed projects.** We will look at what that means in the next lesson. 
