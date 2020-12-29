# No scale without discipline (Software Engineering 101)

## Objectives 
* Understand the difference between programming-in-the-small and large systems programming.
* Be able to explain the basic practices that are needed to deliver software at scale, and why they are needed.
* Understand how to apply these ideas back to open source software projects as learning experiences, and as criteria for judging project health

## Notes
The Institure of Electrical and Electronic Engineers (IEEE) define software engineering as follows: 

> **software engineering.** (1) The application of a systematic, disciplined, quantifiable approach to the development, operation, and maintenance of software; 
> that is, the application of engineering to software. (2) The study of approaches as in (1).

Unfortunately, the same IEEE Glossary standard defines engineering as follows: 

> **engineering.** The application of a systematic, disciplined, quantifiable approach to structures, machines, products, systems, or processes. 

This definition doesn't really give one a sense of why that practice is needed or necessary. 
Looking a little more broadly doesn't help. The Oxford English Dictionary gives us: 

> **engineering.** the activity of applying scientific knowledge to the design, building and control of machines, roads, bridges, electrical equipment, etc.

To give you a sense of how to think about engineering in general and software engineering specifically, it helps to use some examples. 
At dinner with a chemical engineer once, I asked what does a chemical engineer do. 
They replied that when a chemist designs a new useful compound in the lab, but they used a liter of nitroglycerin to produce a gram of the compound, 
it was the chemical engineer's job to design and build a scalable factory process to produce metric tonnes of the new compound without blowing up the city. 
There is a sense of building-at-scale that goes with engineering 

If a person writes a program to solve a problem for themselves, they need to understand the problem and the programming tools at hand to solve it. 
It is the equivalent of creating a new compound in the lab. 
If you share that solution with a few friends, very little engineering discipline is required. 
If you share the solution with a few dozen people, some packaging and installation may be required, along with some documentation. 
Sharing it with a thousand people, and you now need real process and discipline:
* You need to know how to build the program. 
* You need a release process.
* You need to document how to install and run the program. 
* You may want to tell users how to tell you about successes, failures, bugs, and new features that may be useful. 

The more users of a program, the more discipline and process is required to manage the development and delivery of the program at scale. 
At this point, the definitions begin to make more sense. 
One has gone from a programming or software development perspective, where you are focused on the expression of a solution based on its mathematics 
using a set of tools and a language to enable the computer to run the solution, 
to a set of engineering practices that are concerned with consistently delivering an expected solution to users. 

Another analogy here may help and cooking provides it. 
Anyone can quickly learn to fry an egg. 
With some practice and reading, one can learn to cook a variety of meals, 
and may even step up to producing a holiday meal for friends and family, 
or specialize in a skillset like baking. 
But as soon as one says restaurant, everything changes. 
Now that practice and discipline come into play because a set of meals need to be produced reliably and repeatably. 
There is probably a team of people involved with differing responsibilities and skills. 
Costs need to managed. 
This doesn't change regardless of whether one is talking about a two-person taco truck or a Michelin-starred experience. 

It also doesn't matter whether the scale is in people using the software, the size and complexity of the software itself, 
or the number of people building and delivering the software. 
In each case, while the tools and practices may be different, one can't scale without discipline. 

## Large Systems of Dynamic Software
If we look at a large software system, 
then one can quickly realize that the software is organized so programmers can understand the software in meaningful ways. 
There is an architecture to the software, possibly expressed in the directory structures, collections of modules and subroutines into libraries, 
collections of tools or supporting programs together, and the primary functions of the system. 
The collection and architecture allows a programmer to learn the system as it represents a solution to a problem. 
It also allows a knowledgeable maintainer to re-orient themselves within the software system. 
The reason is simple. 
All complex and interesting software is dynamic. 

Software is inherently dynamic. 
Once the initial program is created and deployed, it needs to change (immediately) for a variety of reasons.
Remember that a program is a solution to a problem. It is a malleable machine. 
The solution will need to evolve and change as the problem (and everyone's understanding of it) evolves and changes :
* Mistakes are discovered in the program in the way the solution is expressed.
* Mistakes are discovered in the program based on how it solves the initial requirements. 
* New requirements are realized, and earlier requirements are no longer needed. 
* Genuinely new uses for the solution are discovered.
* Every useful application outlives the platform on which it was developed and deployed. (*Walli's First Law of Applications Portability*)
* Useful applications seldom live in a vacuum. (*Walli’s Second Law of Applications Portability*)

As the software system evolves, stresses will also occur in the system's architecture. 
Every system will reach points in its evolution where it will need to be refactored, 
i.e., redesigned, broken apart, reassembled with new abstration layers to support growth. 

At the same time, there are additional stresses on the team of maintainers themselves.
Often, short-term fixes are applied to correct mistakes. 
These short-term fixes are sometimes rough patches to the software to get something to work quickly because of the urgency required,
or because the cost of the quick fix is low compared to spending a lot of developer time looking for a larger problem. 
Over time these patches start to hide the original architecture of the solution. 
Each decision, each fix, each patch is done for a perfectly good reason, 
but the cumulative decisions begin to create a brittle architecture where it becomes harder and more costly to make subsequent changes. 
Sometimes the system becomes brittle in the sense that making one fix creates more problems. 
This is generally referred to in the industry as software debt in the sense that one is taking out loans with each small fix, 
and that one isn't paying down the mounting debt of growing maintainance costs with a redesign and refactor. 


At no time in this discussion are we talking about open source software per se. 
We are discussing an attribute of large 'successful' software systems. 
They could be bespoke solutions deployed in a company by the IT development staff, 
or a large complex software product developed and sold by a company, 
or a long term  project that is the foundation for a collection of research projects, 
or a software system published under an OSI-approved open source license that has broad use and a large community. 

## Software Hygiene (Washing behind your ears is good practice.)


## Software Construction Activities
Let's go back to the block-and-tackle activities that the maintainers on large successful projects put in place.
Let's look at them through lenses of the on-ramps but re-order them to software development, then deployment and use. 

Project executables are built and available on known platforms.
Project executable software has an automated installer for known platforms.
Bugtracking or issue tracking is available.
Complete source is published and easy to download.
Project build is automated or scripted for known platforms.
Project can be tested to a known state for known platforms.
Project build is sophisticated enough to support easy contributions.
Project testing is sophisticated enough to support easy contributions.
Architectural documentation exists as well as roadmap discussions.

