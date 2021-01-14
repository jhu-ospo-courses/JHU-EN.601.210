


## Notes
I wrote a blog post two years ago called There is NO Open Source Business Model. 
In it, I argued that open source software is really about engineering economics, 
where well-run collaborative communities capture orders of magnitude of engineering value, 
and that Red Hat is really a successful enterprise software company focused on its customers. 
I've held this opinion for a while now. 
We have seen lots of debate this past couple of years from a number of directions on 'sustaining open source' in the face of freeloaders, 
determining significance, the effect of 'Cloud', and venture-backed companies wrestling to build revenue streams. 
This year is also the twentieth anniversary of the Open Source Definition, which has served us well for two decades.
I've typically debated the lack of a business model from an engineering economics perspective, 
focusing on value creation and capture when companies consume externally owned open source project components into their products and services, 
contributing back as an engineering necessity. 
I want to try a different approach in this post and argue from the perspective that a company needs to run a business. 
Most of the complaining about the inability to build businesses using the current OSI-approved licenses 
seem to come from companies creating open source projects and not thinking about the business problem.
If you're a company whose core competency is the development and distribution of software, then the software you create can either:
* Directly support your core value proposition to customers. (The software embodies the solution the customer buys.)
* Is complement value-add to the core value proposition. (Few products stand alone. Building a 'complete' solution makes the core value proposition more valuable and 'sticky'. See Moore.)
* Is simply context that doesn't drive core value. (It's the cost of doing business.)

This thinking has been captured in multiple ways by Geoffrey Moore all the way back in 'Crossing the Chasm' (1991) 
as he discusses core value propositions and complements, 
and later core competency (enabling core value propositions) versus context in 'Dealing with Darwin' (2005). 
The idea of value moving around a product/service network over time is further supported by Christensen in the 'Innovator's Dilemma' (1997).
Early in Christensen's 'Innovator's Solution' (2003), he offered the following tests for a new disruptive business. 
(Christensen realized in a discussion with Andy Grove post-1997 that he was really researching disruptive business models, not disruptive technologies).

For each of the competitive groups listed in the business plan, can one affirmatively answer:
For a new market disruption, at least one and generally both the following questions need to be true:
Is there a large group of people who historically have not had the money, equipment, or skill to do this thing for themselves, and as a result have gone without it altogether or have needed to pay someone with more expertise to do it for them?
To use the product or service, do customers need to go to an inconvenient, centralized location?
For a low-end market disruption, the following two conditions must be true:
Are there customers at the low end of the market who would be happy to purchase a product with less (but good enough) performance if they could get it at a low price?
Can we create a business model that enables us to earn attractive profits at the discount prices required to win the business of these overserved customers at the low end?
Then once you know if you have either a new-market or low-end market disruption: Is the innovation disruptive to ALL of the significant incumbent firms in the industry? If it appears to be a sustaining innovation to one or more significant players in an industry, then the odds are stacked in that firm's favour, and the new entrant unlikely to win.
Let's think about that business reality in the context of using open source as a publication/sharing mechanism and community as an innovation capture mechanism.
Publishing software under an open source license is a powerful way to share software. Individual developers love to share software:
Creating good software is hard work. Re-use in active community is probably the best way we have to support re-use of software that is itself inherently dynamic.
It's a way to learn/improve the software.
It provides developers in the community agency and control over their toolchain and deliverables.
It improves time to delivery of the end result for developers in community, solving their own problems.
It's a way to signal expertise.
It's free so it doesn't create enormous friction in the development pipeline, especially in the early experimental stages of creating prototype solutions.

Building community around such a software project to support the evolution of the software takes work. (Von Hippel has documented this sort of user-centric innovation network since the 1980s in domains as diverse as software, sailboarding, and mountain biking.) For individual developers sharing their own software in community, there is a balance between the value captured and the work to capture the new value itself. Community building doesn't come for free. It requires discipline and tooling to scale, i.e. software engineering expertise beyond the domain expertise in the problem itself.
Caveat Lector: I am not discussing open source consumption economics, just the production side.
If you're a company whose core competency is the development/distribution of software in a problem domain, then building a community in complement value spaces:
Creates stickiness/inertia for the core value.
Creates experts, advocates, and evangelists around the technology from folks that don't yet have money to buy anything from you.
Hardens the complements with new configurations and contributions from folks that don't yet have money to buy anything.
Captures direct value to the complements (which indirectly captures value to the core).
Is possibly disruptive to competitors if the complement in one vendor's portfolio/network of products is really the core value of another vendor's portfolio of products.

If you're such a company, then building a community in context spaces (e.g. Netflix and Spinnaker),
Validates the approach to a problem.
Demonstrates expertise that can be used in recruitment.
Demonstrates committed values to collaboration amongst developers that further recruitment goals.

Now let's think about collaborative communities and open source licenses on core value propositions and go back to Christensen's tests for new businesses.
If you're a company whose core competency is the development/distribution of software in a particular problem domain, then publishing your core value proposition under an open source license:
Makes a potential partner into a competitor because other companies may also have the resources to turn your project into competing products. (They need not directly compete. They may simply cover a similar solution space from a customer perspective.)
Allows users with an advanced understanding of their IT environment (and how they invest in it) to solve their problems with the project without paying you for your product/service/solution. They may make a very different buy versus build decision from the one you want them to make, using 'borrow + share' with your open source licensed project.
Creates market confusion for your sales and marketing team from similar products built from your project. While you can claim copyright and idea ownership and expertise, you're still losing centre of gravity in messaging.

If you invest in building a community around the project that sits on your core value proposition:
You create tension when competitors and [potential] partners and advanced IT users contribute value they want into your core value proposition. The power of innovation capture in a community around a complement becomes the problem of innovation dilution in your core value proposition. (This may have software engineering implications as well as the "simple" solution is being expanded into places the design wasn't necessarily created to accommodate. This may have further social implications in the community as managing the lines of communication gets messier - the cost of Brook's Law.)
You are accelerating the creation of a community of early adopting users that aren't interested in paying for your software, instead of creating Moore's early adopting customers that understood your product solution sufficiently to validate it by giving you money.

In publishing your core value proposition, you have failed all of Christensen's tests that would have given your new market or low-end market business the advantages it needs to succeed. You have given incumbent firms the tools to compete. You have given potential customers the tools they need to ignore your value proposition, and the agency in community to build their own solution.
Brand management is an important skill for a company. This isn't an open source thing. In the '80s, RTI rebranded the company to Ingres because that was the product the customer bought. Relational Technology Inc. wasn't as meaningful. Red Hat rebranded Red Hat Linux, their generation one product, into Red Hat Enterprise Linux, their generation two product, and created Fedora as a nicely linked brand for a fast-moving innovative community (even if the creation of Fedora was a surprising realization after the gen two product was created).
Parking your identity brand on any open source project you own, instead of the product/solution your customers buy, creates confusion for your message to customers.
The engineering economics of collaboratively-developed, liberally-licensed software is incredibly powerful, regardless of whether one is consuming open source licensed projects into one's own solutions or sharing one's solutions with others under an open source license. We have collaborated on software for as long as we've written software, all the way back to 1950. In 1980, the U.S. Congress applied copyright law to computer software. For the next [almost] 20 years developers experimented with licenses to continue to collaborate as they had done, and this culminated in the open source definition 20 years ago.
Open source licensed projects in well-run communities generate enormous value. But projects are not products.
A company needs to create a market around a solution to a customer's problem to succeed. Collaboratively-developed, liberally-licensed software provides a wealth of tools for companies to use. But if you're a company that solves customer problems through the delivery of software, then you still have to run a business. You also need to know exactly what problem you're solving from your customer's perspective. And as Theodore Levitt pointed out,
The customer didn't want a 1/4" drill. They wanted a 1/4" hole.
This past year I've had the pleasure and privilege of debating the existence of open source business models (and the lack thereof) with Jeff Borek from IBM at a number of events, and we'll debate again next week at the Open Source Summit EU, in Edinburgh. Maybe this time, I will find the best way to explain a lack of 'open source' business models.
References:
[1] Geoffrey Moore, 'Crossing the Chasm', and 'Dealing with Darwin'.
[2] Clayton Christensen, 'The Innovator's Dilemma', and 'The Innovator's Solution'.
[3] Von Hippel on open source and user-centred innovation networks, http://www.oecd.org/education/innovation-education/32125887.pdf
