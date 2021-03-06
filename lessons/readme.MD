## Introduction to the Lessons

There are a set of themes I keep coming back to time and again as I work with companies and product teams developing open source projects or consuming projects into products and services to solve customer problems. Many folks want to re-invent what it means or re-discover all the hard won lessons. And perhaps that’s the key to it all for me. Understanding history is important. It sets a context. Otherwise we are caught in our own biases based on our own sometimes limited experience.

What I mean by being caught in our own biases might better be explained with an example. I’m a Canadian born in 1960. To me, I can’t imagine a developed economy without universal healthcare, I am happy to wrap myself in the iconic red maple leaf on occasion, and I know the words to the original version of “Oh, Canada”. But those beliefs are “modern” beliefs. Universal healthcare by all ten provinces didn’t happen until 1961. My iconic flag wasn’t created until 1964. While in common use since 1939, my national anthem wasn’t actually ratified by an Act of Parliament until 1980, the year I started working.

1980 was also the year copyright was applied to computer software in the U.S.. There was finally a burgeoning computer software industry, because in 1969 IBM unbundled the software that was otherwise shipped for free (generally with source) by the computer companies with their computers. Other software written by people using those computers was often shared. The Free Software Foundation began in 1985 as a way to debate how “copyleft” could protect the rights of (typically technical) software users, instead of this new world where copyright protected the software creation distribution channel. 

I hope to draw these memes out across the coming lessons and labs. 

First let’s look at a set of memes about software because it is important to distinguish when you are debating attributes of software versus a collaborative engineering approach to software development and maintaince or a liberal licensing scheme to account for copyright law which cannot be escaped.

## Meme #1: We have shared software since we have written software.
IBM began a computer conference in the late 1950s that continues to this day called SHARE. DEC started in the 1960s and supported the DECUS community, where you could purchase at their conferences (for the cost of the media) mag-tapes full of software that was written and contributed by other people. USENIX began in the 1970s concurrent with the tape distributions of early UNIX releases. But this sharing goes all the way back to work on the first programmable computer in the 1940s at the Princeton Institute of Advanced Studies.

## Meme #2: Writing good software is hard work.
I believe that sharing comes down to the simple reality that writing good software is difficult. Two ratios dominate software creation: The number of lines of code an average developer can write in a day, and the number of errors per thousand lines of code from a reasonable process. All software advances from language evolution (assembler, third generation languages, 4GL, interpreted specialty languages, functional languages) to architecture re-use (functions, modules, subroutines, libraries, objects, distributed objects, REST/SOAP/SOA) has been about trying to write more and better software with fewer lines of code. Advances in software construction reliability, configuration management, review tools and processes, and testing are targeted at reducing the bug count from a reasonable software delivery process. Finding ways to re-use solutions allows us to apply software solutions more quickly and effectively. 

## Meme #3: There is no scale without discipline.
There is a discipline that goes with writing good software. When you look at software that succeeds as a product or an open source project, it is generally peer-reviewed in its creation, version control and configuration management is present, and build automation and testing frameworks evolve with the software. Without reviews, configuration management, and automation of build and test, the software can’t scale in a community of people using it, and it can’t scale as a product with thousands or millions of users. The core group that needs to maintain the software has to be able to answer “what software is executing” and that requires basic software construction discipline. Otherwise it’s chaos and there can be no growth.

This is the heart of software engineering and the ability to deliver and maintain software at scale. Scale comes from several perspectives:
* A program that is thousands of lines spread across hundreds of modules needs a framework to organize and build it. A maintainer must be able to know what software came together into an executable program if they are to be able to maintain it. 
* A program that has hundreds or thousands of users needs a framework to ensure improvements can be delivered to those users reliably.
* A program with a community of developers whether it is a product team or a collaborative community needs a framework to ensure the work of developing and maintaining the program is efficient and effective.

Linus’s Law is loosely stated as “given enough eyeballs, all bugs are shallow.” I think it’s actually a statement about the commit review process. Studies demonstrate more bugs are caught in review than test. A healthy community invariably has a disciplined review process on check-in.

## Meme #4: Software is inherently dynamic.
Programs evolve through use. Bugs are found and fixed. New uses are discovered that drive new functions. The programs are honed and hardened. The program is ported from one environment to another. It is unfortunate that copyright became the way to “protect” the software distribution pipeline in 1980. People may not have understood just how fast software evolves and derivatives are created. And that dynamism has only accelerated with the evolution of the Internet and the World Wide Web. Our sharing network bandwidth has gone from mag-tape-sized packets and conference level and journal publication latency to real-time global creation, distribution, and maintenance around the clock.

These first memes relate to software as its constructed, but I believe they define what we see as successful open source projects because they are fundamentals about software itself. At its simplest, 'open source' is the application of an OSI-approved license to the software. Projects that understand these memes succeed. And the economic relationship works both ways. Software that is liberally-licensed and worked on in community may be the best and most economically efficient software re-use mechanism we have for creating, distributing, and maintaining good software.

Let’s look at some the aspects of community.

## Meme #5: You always get more than you give.
This is the economic efficiency of collaborative development in community. Contribution flow is the life blood of the evolution of the project software. A contributor risks little giving a contribution or a bug fix, but gains an entire working body of software to be used as the contributor sees fit. And for drive by contributions, that may be the only substantial contribution the developer had to give regardless of their experience and expertise. (Contrast this with a company carrying the fully-burdened cost of a “fungible developer resource.”)

And getting more in return than was contributed applies to companies as much as individuals. The dedicated resources and investments from Red Hat, Intel, and IBM to name a few, allows each of them to pursue different business strategies with an entire Linux operating system. Companies can shape good software projects into products that solve customer problems.

## Meme #6: Free-loaders means you're doing it right.
It has been anecdotally observed that for every thousand users of an open source project, a hundred people may report a bug, out of which ten people contribute a potential fix, and only one of those read the contribution guidelines. The reality is there are three on-ramps for community success as measured in contribution flow and growth. The software needs to be blindingly easy to install and use, so the project gets lots of users. In that user base, there will be developers. The software needs to be blindingly easy to build and test to a known state, so developers that want to change something (for their own **selfish** interest) can easily do so. The ability to contribute a change back to the project needs to be blindingly easy, so that contributions flow. Lots of freeloaders means you’re doing it right. With lots of users, comes the potential for developers, and the possibility of contributions. But the onus is on the project to make it easy.

But companies that try to create open source projects often have a tough time understanding the last meme. They think some how someone should be giving them something. That’s because there are two memes that apply to companies and open source.

## Meme #7: Don’t confuse products with projects.
A project is a collection of working software that installs and runs and solves an interesting problem. It’s a collaboration and conversation in code. Projects are NOT products. A product is something that solves a customer’s problem for money. While a lot of excellent software can come out of a well-run open source project that relieves some of the work for engineering, there is enormous work still to be done to turn it into a problem-solving product for customers. The Linux kernel is a project. Fedora is a distro project. RHEL is a product. Products meet customer expectations of value for money. They install out of the box, run, and come with warranties and indemnifications, services (support, upgrades, training, consulting), and product specific documentation. They may be a part of a larger portfolio including hardware and services. [A corollary for this meme might be: no one is coming to build you product for you.]

## Meme #8: Don’t confuse customers with community.
If Meme #7 is about engineering and business model, Meme #8 is about messaging and sales. Communities and customers live in different value spaces. Communities have time, but no money. Customers have money, but no time. Perhaps a better statement is that customers spend money to expedite a solution and remove risk, while communities (individuals in community) have no money.
Some companies using open source think that the project community is a part of the product pipeline, and they further believe this when they find customers in community forums. They may even think the community project is a try-before-you-buy. All of this is wrong.
The conversations that a company has with its relevant communities versus paying customers are different. Each conversation has specific tools and rules of engagement, and metrics to capture and consider. Community members are incredibly valuable, but they’re not customers.

## Meme #9 Companies shared liberally-licensed software long before the open source definition.
Many portray open source software as the amateurs and lone hero-developers creating value, but companies and academic institutions have a long history of creating and participating. Project Athena (X11, Kerberos) began in 1983. The Open Systems Foundation (OSF/Motif, OSF/1) started in 1988. DEC developed Ultrix and Sun Microsystems developed SunOS out of the early BSD releases in the 1980s. Red Hat and SuSE were distributing Linux distributions before the open source defintion (OSD) existed. This is not new behavior.

## Meme #10 Software freedom and open source licensing are different discussions.
Arguing about software freedom versus open source software is like debating whether democracy is better than capitalism, or free speech is more important than free markets. They are each important discussions in their own rights, and people often have a natural affinity for one subject or the other, but they are not the same discussion. They are not end points on a continuum. The language of software freedom is defined by the rights of users. The language of open source software is defined by attributes of a license. These are different discussions.

## Meme #11: Every open source project needs a license.
Software is covered by copyright law. We cannot escape this reality without changing the law. The license defines how other people can use it. Choose an OSI approved license. The license you choose is a statement about the social contract you want in community. While lots of folks in recent history have defaulted to the Apache Software License as the “business friendly” license, it may not necessarily be so. Reciprocal licenses versus permissive licenses is not a discussion about free software versus open source software. Reciprocal licenses may be the best ecosystem friendly licenses in many cases.

## Meme #12: Non-profits have their place.
Non-profits provide the level-playing field and neutrality of IP ownership that enables dedicated company investment in a well-run open source project. 
Non-profits remove liability from project maintainers allowing the project to grow. 

As I look back across these memes, I think they’re the same memes I would have written down 20 years ago, but perhaps without the crispness that comes from history and experience. Now, on to the lessons. 

*[This page is derived from ["My History of Free and Open Source Software"](https://medium.com/@stephenrwalli/my-history-of-free-and-open-source-software-1bac0a75a6ba), which was published on Medium, 20 March, 2016.*


