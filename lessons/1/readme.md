# A brief history of software collaboration from 1950 to 2020

## Objectives
* Understand the breadth of history of software collaboration that culminated in the open source community
* Understand the key points along the timeline getting us to 2020
* Understand the open source definition formally and informally

## Notes
### Collaboration and communities
“We’ve known how community works, since you had a campfire and I wanted to sit beside it.” This is a simple truism about humans, the societies we build, and their success. Furthermore, we have collaborated on software since we’ve written software, and this collaboration goes all the way back to the early work on programmable computers by von Neumann’s team at Princeton University. Writing good software is hard work. All the investments that have been made in computer programming and software engineering this past 70 years have been essentially about writing more and better software in fewer lines of ‘code.’ Developers collaborating in communities, the idea behind open source software, may well be the best software re-use strategy society has yet invented.  

To come to that idea, we need to consider the history around software sharing, the nature of copyright and licenses, and how these communities form, organize, and govern themselves. Then we can understand better the engineering economics and business implications. 
 
### Intellectual Assets to Intellectual Property
The creation of complex software requires intellectually challenging effort. There was a time through the 1950s, ‘60s, and ‘70s, however, when the software was often created by the computer manufacturer and bundled with the computer. The cost of the computer itself far outstripped the human cost of developing software for it. Conferences organized by computer manufacturers in this period were opportunities to share software practices, ideas, and the software itself. The IBM conference started in the 1950s was itself called SHARE. DECUS was the user society that sprang up around Digital Equipment Corporation computers in the 1960s. As AT&T Bell Labs began to share tapes of the early UNIX operating system, USENIX became the conference where folks began to share software tools and practices based on it in the 1970s. 

In 1980, everything changed when copyright was applied by the United States Congress to computer software. Copyright is the legal mechanism historically used to protect the distribution channel. It cost money to bring an author’s creation to the masses, editing, printing, and then distributing and promoting the finished book. Copyright law gave distributors the legal framework to protect their investment. Copyright law goes all the way back to the Statute of Anne in England (1710). It was constantly evolved as it applied to new formats, and media, and performative works. Once applied to software, however, what had been intellectual assets that could be freely shared in a community of like-minded users were now legally intellectual property to be protected.

In the forty years since copyright was applied to software, the cost of the computing hardware has plummeted against the capabilities of the hardware, the capabilities of the hardware have increased dramatically, while the cost and complexity of computer software has increased.  Computer hardware, programming languages, and operating system interfaces have standardized through this period (as both de facto technologies and through rigorous de jure processes). The creation of the Internet and World Wide Web through standardized hardware and software interfaces and protocols removed friction from the digital distribution pipeline. Software was no longer printed to media and shipped, but could be distributed and updated virtually for free across the Internet. These trends together enabled a rich and vibrant computer software industry, separated from the computing hardware, to grow and thrive.  

### Intellectual Property and Industrial Scale
Creating a computer program to solve a problem is an intellectual pursuit. If we were to write a program for ourselves to solve a problem, it requires knowledge in both how to solve the problem algorithmically, as well as the knowledge to express the solution in software for the hardware to execute. But if we are creating a computer program that we will share with a small group of ten friends, there is additional work required to ensure we can package and deliver the software to them. If that number of friends was to grow to one hundred, considerably more work is needed to ‘maintain’ the software package. As with all engineering endeavors, as one scales the number of users of an artifact, one needs more disciplined practices and processes to manage the work efficiently to create, package, distribute, and support it all at scale. 

Software companies became extremely efficient at these engineering-at-scale practices. Through the 1980s and 1990s and into the new Millennium, the software industry grew selling software protected by copyright. Whether the price was considered a license, a support contract, or evolved into an ongoing subscription, is somewhat irrelevant. At the same time, a large number of businesses and governments still created an enormous amount of bespoke software in IT departments because there are many problems that can’t necessarily be solved ‘out of the box’ by a piece of bought software. The ‘build versus buy’ analysis is well familiar to every software company product manager and corporate IT manager. 

## Early experiments under copyright
This dichotomy (bought versus bespoke software solutions) is the world in which open source software and free software have thrived as well. While copyright applied to computer software required licenses to define the terms of use of the software intellectual property, the idea of sharing and collaborating continued. Just as software companies created licensing agreements to define such terms with their customers, developers wanting to continue to share and collaborate likewise needed to create licenses to allow their work. 

Several licensing experiments began in the 1980s and 1990s to enable such collaboration:
* Project Athena at MIT was a collaborative experiment between DEC, HP, and IBM, researchers, and others, leading to the X11 Windowing System and Kerberos. It was the start of the MIT/X11 licensing experiment. 
* The early articulation of Free Software ethics began in the early 1980s and led to the ideas of copyleft, a user’s rights with respect to software, and the GNU Public License. (We will discuss more about software freedom and ethics later in this lesson.) 
* The Berkeley Software Distribution (BSD) begun in the Computer Science Research Group at UC Berkeley led to the BSD license variants that began to show up in other collaborative projects like the early Apache web server project. 
* The Perl language licensed under the Artistic License was the basis of an enormous community of developers and systems administrators sharing and collaborating on the Perl programming language and tools written in it that thrives to this day. 

The industry would not think about these licenses as classes of 'open source' licenses until the end of the 1990s, but for 18 years developers and companies continued to share software as they experimented with licenses that enabled such collaboration, just as they had shared software for the previous 30 years before 1980. 

## Software Freedom, Open Source Software, and the OSD
One of the early license experiments was started by Richard Stallman at MIT. At the time he couldn’t get access to the source code for a binary executable from a vendor to fix a bug that was causing him grief. In the ensuing battle of wits, Stallman made a declaration of software freedom in the GNU Manifesto (1983), supporting the idea that there were a set of freedoms that every user of software must have. This list eventually evolved into what it is today: 

* The freedom to run the program as you wish, for any purpose (freedom 0).
* The freedom to study how the program works, and change it so it does your computing as you wish (freedom 1). Access to the source code is a precondition for this.
* The freedom to redistribute copies so you can help others (freedom 2).
* The freedom to distribute copies of your modified versions to others (freedom 3). By doing this you can give the whole community a chance to benefit from your changes. Access to the source code is a precondition for this.

Understand this frustration still echos today. Insulin pumps and implantable cardioverter-defibrillators (ICD) have software in them that is only viewable by the device manufacturer. The Federal Drug Agency approval process in America for such medical devices doesn’t provide for a vigorous inspection of the software. While one could argue for other methods of inspection, the free software argument is compelling to some. 

As a hack on copyright law, the GNU Public License (GPL) supported these freedoms when applied to software. The GPL has evolved a few times since 1985 but it essentially says that you are free to do what you want with the software, but you must publish any changes you make to the software if you then distribute the software under the GPL. The license becomes ‘sticky’ to all software derivatives. (A derivative is the result when you take something protected by copyright, e.g., an article or software program, and change it in some way. When you fix a bug in a piece of software or add a new feature, the result is a derivative.)

Many other licensing experiments were still underway but Free Software was a movement as well as license. 
It was also seen as a highly controversial movement at the time. 
By publishing the software under liberal license (GPL), and forcing the publication of all distributed derivatives under the same license, 
the license potentially became sticky to other peoples' software. At the time, many companies were keeping their software secret believing that would prevent copying (regardless of the license). 

Other experiments were going on at the same time. The Berkeley BSD work and MIT Athena work were growing communities of users. The Perl language was launched as a language to solve lots of automation problems that had required shell scripts and tools like `awk` and `sed`. These are all substantial bodies of work. As the 1990s began and the Internet began to grow, networking stacks and tooling around the IETF protocols began and became collabortative communities. The Apache webserver project (`httpd`) started in 1995 and still drives almost a third of the websites on the Web 25 years later. Linus Torvalds released his fledgling Linux project in 1991 under the GPL and has never looked back. They Python language had been released under a liberal license by Guido van Rossum, as had Tcl/Tk by John Ousterhout. 

By 1998, there was a rich growing community of collaborative communities, all liberally licensing their software under a collection of licenses. Netscape published their Netscape Navigator browser as the Mozilla project in January 1998 marking the first software company to step into the discussion. In April of that year, a group of people met to determine how best to bring the ideas inherent in software freedom into a more commercial discussion. This meeting led to the Open Source Definition (OSD) and the formation of the Open Source Initiative (OSI). 

Starting with the Debian Free Software Guidelines, the OSI focused on the attributes a software license must support to be considered an open source license to produce the Open Source Definition: 
1. Free Redistribution: The license shall not restrict any party from selling or giving away the software as a component of an aggregate software distribution containing programs from several different sources. The license shall not require a royalty or other fee for such sale.
1. Source Code: The program must include source code, and must allow distribution in source code as well as compiled form. Where some form of a product is not distributed with source code, there must be a well-publicized means of obtaining the source code for no more than a reasonable reproduction cost, preferably downloading via the Internet without charge. The source code must be the preferred form in which a programmer would modify the program. Deliberately obfuscated source code is not allowed. Intermediate forms such as the output of a preprocessor or translator are not allowed.
1. Derived Works: The license must allow modifications and derived works, and must allow them to be distributed under the same terms as the license of the original software.
1. Integrity of The Author's Source Code: The license may restrict source-code from being distributed in modified form only if the license allows the distribution of "patch files" with the source code for the purpose of modifying the program at build time. The license must explicitly permit distribution of software built from modified source code. The license may require derived works to carry a different name or version number from the original software.
1. No Discrimination Against Persons or Groups: The license must not discriminate against any person or group of persons.
1. No Discrimination Against Fields of Endeavor: The license must not restrict anyone from making use of the program in a specific field of endeavor. For example, it may not restrict the program from being used in a business, or from being used for genetic research.
1. Distribution of License: The rights attached to the program must apply to all to whom the program is redistributed without the need for execution of an additional license by those parties.
1. License Must Not Be Specific to a Product: The rights attached to the program must not depend on the program's being part of a particular software distribution. If the program is extracted from that distribution and used or distributed within the terms of the program's license, all parties to whom the program is redistributed should have the same rights as those that are granted in conjunction with the original software distribution.
1. License Must Not Restrict Other Software: The license must not place restrictions on other software that is distributed along with the licensed software. For example, the license must not insist that all other programs distributed on the same medium must be open-source software.
1. License Must Be Technology-Neutral: No provision of the license may be predicated on any individual technology or style of interface.

Attributes of licenses versus freedoms for users.

Ethics versus Engineering. 


