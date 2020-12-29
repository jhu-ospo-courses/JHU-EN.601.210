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

