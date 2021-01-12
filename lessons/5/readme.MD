# What is this madness called licensing and why you might care (a little)

## Objectives 
* Understand the (very) simple basics of intellectual property protection
* Be able to explain the basic license groups in the free and open source software space
* Know the basic licenses, and where to find more data
* Have some understanding of current controversies and the implications in an open source community

## Notes
> 
> **IANAL** It is important to understand and remember that I am not a lawyer. This is not legal advice. 
> This experience is based in the U.S. and your mileage may vary.
> 
### Everything you need to know about licensing in 2 minutes 

* Software is protected by copyright law in the U.S. and many other countries.
* Anyone that wrote the software, owns the copyright and can say how it is used. [**NOT** saying how it can be used does **NOT** remove your responsibility as the owner, even if you don't care.]
* People sometimes give up their copyright ownership to the software they write in their employment agreements. [If you didn't read your employment agreement, you're probably not a professional software developer.]
* If you want to liberally share your software with others so they can use it for anything, there are a few well-accepted SIMPLE licenses (Apache 2.0, BSD, MIT). 
These essentially say:
  - Do whatever you want with the software.
  - Don't claim my work as your own.
  - Do give me credit for my work.
  - THIS SOFTWARE COMES WITH NO WARRANTIES, USE AT YOUR OWN RISK, [ALL IN CAPITAL LETTERS BECAUSE WE REALLY REALLY MEAN IT].

It takes about two minutes each to read the [Apache 2.0](https://opensource.org/licenses/Apache-2.0), 
[BSD](https://opensource.org/licenses/BSD-3-Clause), 
and [MIT](https://opensource.org/licenses/MIT) licenses. Pick one. 
They are good enough for one of the most successful collaborations we have witnessed in the short history of software development, 
and for two institutions for higher learning recognized for their contributions to computer and software technology. 
These licenses were written by lawyers that understood software copyright law and liberally sharing software. 
Apache 2.0 licensed projects are powering the growing business ecosystems of cloud computing, 
and have successfully powered the rise of the web for 20+ years. 
No lawyer you hire will do better, indeed, they may slow you down. 

If you are publishing software on GitHub, 
it will take you less time than reading notes to visit the appropriate OSI URL, copy the text, 
and paste it into a LICENSE file in the top of the tree with the appropriate minor edits for date and project name.

If you care about software freedom, 
then you are admitting you have already probably read more on the topic than the average developer, 
and can go refresh yourself on the [excellent Free Software Foundation essays](https://www.gnu.org/philosophy/philosophy.html), re-read the GNU licenses, 
and choose appropriately.

If you are trying to "make money" from your software, 
then you are admitting you need to involve a lawyer in your business, 
or spend enough time educating yourself on the business tools available in your chosen profession. 
A very good reference for developers is Van Lindberg's 
'[Intellectual Property and Open Source](https://pdfs.semanticscholar.org/6e91/9a6a1f641f741214a64b803d8890fb4b43cd.pdf)'.

If you think you need an opinion on software patents, then you are (again) admitting that you probably need to talk to an attorney or read the book.

That's it. There's the two minute lesson.  (If you read quickly, it was over faster.)

Any other discussion is window-dressing if you write software for a living or for other people to use. 
If you want folks to use your software, license your work. Writers do it. Artists do it. Engineers and architects do it.  
So should you.

### A longer discussion about which open source software license should you use? 

The first and obvious consideration is whether or not the license is approved as an open source license by the Open Source Initiative (OSI). 
As we saw, the OSI created the Open Source Definition in the late 1990s as a set of attributes that a software license must support to be considered "open source." 
Anyone can take a license to the OSI for debate and discussion and if approved as meeting the OSD, 
then the license is added [to the canonical list](https://opensource.org/licenses).

While this seems an obvious place to start, 
you will still see situations where a corporate lawyer has taken an approved license and made a few 'minor' edits for clarification. 
Inventing new licenses as small derivatives of existing licenses is not helpful and creates costly legal busy work. 
There exists a broad collection of OSI-approved licenses today. 
These licenses cover hundreds of millions of lines of software involved in billions of dollars in procurement. 
One would be hard pressed to describe a serious set of circumstances that isn’t already covered by an OSI-approved license.

There are several big levers available when considering an open source license:
* How much license reciprocity is required with respect to the software, modifications, and any derivatives someone develops?
* What is said about patent licensing and litigation?
* What legal jurisdiction covers the license?

The reciprocity issue is all about "copyleft" and whether or not using the software source code attaches the license to the modifications and derivatives, 
and whether the source code to those modifications and derivatives needs to be published.

On one end of the spectrum are licenses that have no copyleft requirements. 
These licenses essentially allow anyone to use the software in anyway without requiring much more than maintaining copyrights. 
Licenses that fall into this set include the New and Simplified BSD licenses, the MIT license, and the Apache 2.0 licenses.

There are a set of licenses that maintain a sense of copyleft around the software itself 
but support the use of the software in larger works of software which may contain software that is licensed differently (e.g. closed and proprietary). 
These licenses include the Eclipse Public License, and the newer Mozilla Public License 2.0.

On the other end of the copyleft spectrum are strong copyleft licenses. 
Software freedom is defined by the Free Software Foundation in terms of the freedoms a user of software must have. 
Strong copyleft supports software freedom. 
Many developers support software freedom, 
and demonstrate this support using one of the family of GPL licenses (GPL2.0, GPL3.0, and the Affero GPL3.0) 
as a way to ensure the strongest copyleft and strongest license attachment when the software in question is used in building and distributing other software.

Software patents weren’t really an issue when software was beginning to be widely shared on the early Internet and so weren’t mentioned in the early licenses. 
By the late 1990s, 
software patents were on the rise and corporate legal teams were becoming more involved in the writing of open source licenses 
as they became more involved with open source software and developing the open source non-profits around evolving projects. 
The Apache 2.0 License, Mozilla Public License 2.0, Eclipse Public License, and the newer GPL licenses reflect this shift in language. 
Each license explicitly talks about patent licenses. 
Each license has language that covers patent litigation to varying degrees.

I mention legal jurisdiction in the big levers category because some licenses explicitly mention it 
and this can be a real show stopper for some people. For that reason alone I treat it as a Big Lever. 
(The Mozilla Public License 2.0 specifically tries to deal with jurisdiction as one of changes from the original MPL, 
as that was often a criticism of the earlier license.)

Other considerations in license choice include:
* Are there project specific affinities?
* History of the license and non-profit/corporate/commercial involvement?

The "language" projects (Perl, PHP, Python) each have their own licenses 
(Artistic License 2.0, PHP License 3.0, and Python License 2.0 respectively). 
If you are working on a project that closely ties to a specific open source programming language community 
then you should obviously consider that community’s license as the question of mixing modules and dependencies 
will be simplified with respect to open source licenses.

As software IP law has evolved and the Internet has become an enormous space for people to collaborate on software development, 
commercial organizations became involved. 
We have seen the creation of open source software non-profit organizations with specific licenses associated with them. 
Corporate legal teams have become involved in authoring open source licenses, 
and the language and structure of these licenses (e.g. terminology and definitions) reflect this involvement. 
Lawyers without a lot of experience in open source licenses may feel more comfortable reviewing these newer licenses.

So to recap, 
presuming that your primary motivation is to co-develop and collaborate on an open source project, 
in my way of looking at open source licenses your choices break down roughly as follows. 
(I'm keeping the discussion here to widely used licenses and/or 
licenses where large commercial organizations with conservative counsel or neutral non-profit open source foundations had a hand in their creation.)

If you want to allow anyone to do anything at any time with the software, 
use the MIT or new (3-clause) BSD license, i.e. no copyleft and no discussion of patents. 
Both of these licenses came from the academic world, and both from a period of time where software patents were not a focus.

If you want to allow anyone to do anything with the software (so no copyleft), 
but feel something needs to be said about patents and license termination in the face of litigation, 
and/or you want a license that corporate counsel is more comfortable reading then look at the Apache 2.0 license. 
These licenses were written to continue to encourage a completely open sharing environment 
but were written with a more corporate view (note the structure and language), 
and both begin to cover patents with varying (and subtly different) degrees of patent retaliation built into them.

If you feel others should be able to build [possibly closed proprietary product] around your software, 
but want to ensure changes to the core software project itself remain open source (i.e. the changes must be published), 
you likely want to look to either the Eclipse Public License, or the newer Mozilla Public License 2.0. 
These are modern licenses developed from commercial/corporate perspectives supporting "weak" copyleft. 
[N.B. The EPL does name NY State as the jurisdiction.] Pay attention to patent statements in each.

If you are a firm supporter of software freedom 
or want to ensure that if your software source is used anywhere that the resulting derivatives are maximally published as open source ensuring software freedom, 
then you should look to GPL2.0 or GPL3.0 depending upon your needs.

There are a couple of interesting side ideas I’ve come across in the open source licensing space 
as different projects wrestled with how best to create the "right" licensing for their software.

* Many companies are concerned about their patent portfolios when creating open source projects. 
Google took an interesting approach to the problem when they released the WebM project. 
They chose the New BSD license and then created a very specific "Additional IP Rights Grant" to cover the patent language they needed.
* It is the nature of IP law that the owner of the property can license it as many ways to as many people as they choose. 
This is why the Microsoft EULA for a personal copy of the Windows operating system is different from an Enterprise License Agreement 
and how MySQL AB developed a line of business around closed software licensing as well as their GPL-licensed project. 
In the early days (up through PHP3), the software from the PHP project was similarly "dual" licensed under both the GPL2.0 and an earlier PHP license to allow the software to be included in as many places as possible because the GPL was not directly compatible with the PHP license of the time.

I have deliberately not tried to create a table or decision tree for license choice here. 
I believe there are sufficient edges and nuances to license choice that it can never be properly "automated" 
with the licenses we have today that reflect their rich background of needs and history. 
There is always one more legal question of "what about the situation when...?" 
Such questions will likely involve legal counsel and may be very jurisdiction sensitive.

Likewise, open source software licenses don’t simply reflect a set of legal choices. 
In the early stage of an open source project when the author or authors are first publishing the software, 
the choice of license reflects as much of the social contract that is being made for the project as any legal requirements. 
It is the first governance document of the early possible community that comes into play long before formal governance, mission statements, 
and codes of conduct may be created around growing community.

Excellent information on how to consider various software licenses in combination with the GPL can be found here: http://www.gnu.org/licenses/license-list.html#SoftwareLicenses



