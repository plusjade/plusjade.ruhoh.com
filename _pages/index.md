---
title : Home
description:

layout : page
---

# Goals

My goal is to provide you with a conceptual understanding of how modern web applications work; how they are designed, how they are built, and why they work the way they do.

A fair number of people understand the basic idea behind how a car works or what makes an Airplane fly but they don't necessary want to be mechanical engineers. In the same way this book will give you an easy to understand and comprehensive mental and visual model of all that is going on in a web application but _not_ in an exhausting and heavily technical way.

**This book is all about _concepts_**.

I'm a firm believer that all good learning is rooted in a firm understanding of basic root concepts.

Modern web applications are by nature highly technical and complex. Many smart people work very hard to make the Internet what it is today. 

But the core _concepts_, the philosophy and design strategy that model this complexity can be very simple to understand.  

And now an obligatory Leonardo da Vinci quote: 

> _Simplicity is the ultimate sophistication._  

# Getting Started

It is important to attach specific definitions to terms we talk about in the context of this book so that we can ensure we are on the same page.

First and foremost what is a web application? Let's break that question down into its core parts: the application part and the web part:

# What is an Application?

>An application is a computer software program designed for the user to perform a task. 

Microsoft Excel, Microsoft Word, and Photoshop are common examples of  applications that traditionally run on a desktop or laptop computer.

Applications may run in many different environments such as desktops, laptops, smartphones, and tablet computers.
Google, Facebook and Twitter are examples of applications that primarily run through the _Internet_. There are also _mobile_ applications that download and run on your smartphone or tablet device.

It is important to note that applications must be built _specifically for each environment_ they intend to run on.
Creating an app that runs on an Android phone will not run on an iPhone or on your laptop.

However there is one element common to all the environments we've mentioned;  they are all connected to the Internet.

We can reason that it becomes possible to use this common access point; the Internt, to provide a _web_ application that works across all these environments by default.

So a _web_ application is an application that works entirely through the Internet and can potentially be accessed through multiple environments -- sounds great!
But first let's make sure we understand what the Internet is...

# What is the Web?

In a nutshell the Web, or Internet, is a network of computers. 
Any computer can be connected directly or indirectly to the Internet. 

The computers connected to the Internet can make certain content publicly accessible to other computers in the network (the Internet).
They can also receive content that other computer's make available.

A **Server** is a computer that has been tuned to serve content on the Internet in an efficient manner.
Servers use the same basic hardware as any normal computer including your laptop, the difference lies mainly in the configuration.

For what it's worth you can technically serve a website to the entire planet using only your personal laptop computer -- the principles are the same, only the configuration changes.

# How Does the Web Work?

For the purpose of this book we will cover how the web works relative to consumers of web applications.
That is to say if I make a web application, how does the web enable my users to consume my product?


Remember the Internet is a network of computers. All computers in the network can send and receive information.
**Servers** send content to your customers, the end users.
End-users interact with your content through an interface called the **Client**.

Let's visualize this relationship:

        [client]  [client]  [client]
          |         |          |
      -------------------------------- Internet
          |          |            |
      [Server]    [Server]     [Server]



## The Client

The client is the medium with which your end users _experience_ your application.

Remember applications are software programs so there needs to be _somewhere_ where those programs run. The **client** is what runs the programs.

Since the client is what runs your application, you'll need to program your application in such a way the target client can understand. Certain clients only understand certain types of code.

A common example of an application running on a client is Microsoft Word and Photoshop. These apps must be installed on your computer so the Operating System itself (Windows, Mac) acts as the Client. That's also why there are multiple versions of the same application but built for different Operating Systems.

When an application is built for a device's Operating System, it can be thought of as platform-specific because it can only work on that Operating System.

### Platform Specific Applications

Platform-specific web applications, otherwise known as **native applications** must be manually installed on the device so that they can interact directly with the device's Operating System and hardware.

iPhone and Android "apps" are good examples of native applications that must be manually installed to a user's smartphone.

Native apps offer a superior user experience simply because they have access to more features directly available on your device.

But as mentioned you will have to build an application _specific_ to every device you want to support.

Building applications for _every_ platform sounds like a lot of work. Wouldn't it be cool if we could build a web application that worked across all platforms?

There is one client that works on all web-enabled platforms:

### The Web Browser

The Web Browser is actually a **native application** that comes pre-installed on most all web-enabled devices.

Instead of having to build a native app for every device's Operating System, we can now build an app that works _inside_ of the Web Browser. This shifts the client from the Operating System to the
Web Browser.

All web browsers (ideally) provide a standardized programming interface framework for running applications regardless of the Operating System they are installed on.

In other words, if an application is programmed to run in the web browser, it will work _anywhere_ a web browser is installed:

- Windows computers
- Mac computers
- Linux computers
- IOS (iPhone, iPad, itouch) mobile devices
- Android mobile devices

This makes it clear to see that programming a web application for the web browser client is a very effective way to reach the most users.


      [desktop app]  [iPhone]  [iPad]  [web browser]
        |         |          |
    ------------------------------------------------ Internet
        |          |            |
    [Server]    [Server]     [Server]



## The Server

The Server is responsible for maintaining, sending, and receiving all the data necessary to make an application work through the Internet.

You can think of a Server as a big central repository of information and computing power. 

Web applications may display, create, and manage images, audio, videos, and data which can be stored and retrieved from the Server.

Additionally, the Server acts as a remote computer that allows your users to perform tasks their own personal computers are not equipped to handle or would not be powerful enough to process.

### Example

Consider an example web application that provides driving directions from one place to another. This application needs to:

- Store a world-wide database of mapping coordinates and addresses.
- Calculate the most efficient route.
- Calculate each step of the route. 
- Draw the route on an interactive map. 
- Provide a list of procedural directions.

**No Internet Access**  
Without the Internet, the application  would have to have all of the data available within the app itself.
It would also only work on computers with enough computing power to process the calculations.
Lastly it would have to be manually updated with code updates and changes to the route database.

**With Internet Access**  
Using the Internet, however, the application can offload all of the data onto the Server. It can also employ much more powerful computing resources on the server for handling complex route calculations.

Now the client application need only have access to the Internet, ask the question to the server, and have the server compute the answer from its own database using much more powerful computing resources.


## Client-Server Interaction

So how exactly does the client "ask" the server questions and get back answers?


The server exposes _endpoints_ to the Client that do different things based on how the user interacts with those endpoints.
Modern web applications use URLs as the application _endpoints_.

Here's a very simple example:

    http://www.myapp.com/notes
    http://www.myapp.com/notes/add
    http://www.myapp.com/notes/1
    http://www.myapp.com/notes/1/delete

Notice the different URLs relative to the main domain name: http://www.myapp.com

    /notes            - show a list of all notes
    /notes/add        - add a note by sending text to this URL
    /notes/1          - show a single note identified by ID 1
    /notes/1/delete   - delete the note having ID 1
    

All user-facing web applications work this way. Servers can provide an unlimited number of special endpoints 
to the Client application by way of the URLs.  
A user's actions via the Client are mapped to these URLs. As the Client issues the action
it sends data to the server _at_ a specific URL which the server processes based on _what_ data was sent
and _which_ URL it was sent to.


    [diagram: Facebook interactions between client and server]


# Web Application Design

We've covered the relationship between **Client**, **Internet**, and **Server**.
We've learned that the Servers provide application functionality and resources by means of URL endpoints to the various Clients via the Internet.

So just how exactly do we design our application? What exactly goes on the Server? How do we provide the Client with our URL endpoints and coded programs? Let's find out.

## Backend

The **backend** is a developer term used to describe all the **Server** related components in a web application.
Modern web applications actually use _many_ servers applied in a wide range of configuration formats as we'll cover later.

The backend is responsible for responding to all requests made by the Client(s).

Remember that an _application_ is a software program and a software program is composed of code logic. So when we say our _application_ runs on the backend, we mean that the software code logic is literally installed on the backend servers as a server-side application.

The server-side application is what determines (based on the URLs) what actions to take in order to build the appropriate response to the Client.

The Server can send a response in a variety of formats:

### Media

Media such as images, videos, music files, pdfs, etc are sent to the client as a direct download or to be used to compose the web-page that the Client will show the user. Every media file has a unique URL that needs to be used to fetch the asset.

### Text/HTML/CSS

Text/html/css is sent to the client in order to build the User Interface that the Client will show to the user. The particular template, colors, layouts, and controls like buttons and forms are all configured using text/html/css.

### Data

Modern web applications commonly send raw data structures as responses so that a _receiving_ application can load this data into it's environment. For example you can request a list of a person's public Facebook friends which will be sent as a raw data format called JSON. 
If you've ever used an application that showed a list of your Facebook friends, this is how they do it! We'll cover more about this in the next section.

### Code

The server can indeed send _application code_ to the Client to be run as a _client-side application_.

Our web application is now actually broken up into two parts:

- the server-side application logic
- the client-side application logic.

This sounds complicated but one of
the cornerstones of modern web application development is the ability to run robust client-side applications right in the web-browser.

## Frontend

The "frontend" is a developer term used to describe all the **Client** related components used in a web application.
When the backend sends data to the client, it is the client's job to _process and render_ this data into what the end-user sees.

A web browser only understands 5 types of data:

- **Media files**  
  Used directly, e.g. an image is displayed, a video is streamed.
- **Text**  
  Provides content and/or data to the client.
- **HTML**  
  Markup language used to give structure _to_ the rendered content.
- **CSS**  
  Styling language used to _style_ the rendered content + structure. Colors, fonts, layout etc.
- **Javascript**  
  Programming language that can run your client-side application.

The browser uses all 5 data types to compose the "web page" more modernly referred to as the User Interface or UI.

### Interacting with the UI

The UI can be programmed, using HTML and/or javascript to carry out tasks when the user interacts with with the UI. Filling out a form, clicking a button, dragging an element, etc.

These tasks can send requests back to the server and wait for the response back. The server can then send the top 5 datatypes we've discussed, which can be used to _instantly_ update the UI.

In this way a user can click a button to "view Joe's friends", whereby the client-side application will ask the server-side application for a list of Joe's friends in "raw data" format, the client-side application will take the server's response and use that data to update the UI with a list of Joe's friends.

The more robust your application the more server-to-client exchanges will be taking place.

Consider also that our application so far only supports one client: the web browser. Ideally we'd want the same backend to support an iPhone or Android native Client.

We need to design a sane strategy for dealing with _multiple_ clients that may potentially have robust client-side applications asking tons of questions to the server-side application.


## API

The API or "Application Programming Interface" is a a developer term used to refer to the way in which two applications connect with one another. In this case the frontend clients need a _systematic_ and _well-structured_ way to interact with the backend application.

We've learned that the backend integrates with clients by means of different URLs. 
The URL scheme is a good and necessary part of an API but we need to be even more specific
about _how_ exactly the data is structured and _what_ data is accessible in the first place.

The API must also describe how it expects to _receive_ data and _where_ this data may be sent.

API development is another cornerstone of modern web application development. 
Though it can get quite technical, the essence of what an API is is very simple:

> a well documented **agreement** between two applications regarding how to talk to one another.

When we understand that the Internet is essentially millions of connected applications, we can see that APIs are powering _most_ all of what is going on behind the scenes as we use the Internet.

    [diagram: example of an API request/response cycle]
    

# API Design

Web application APIs should be designed to support a wide and varying degree of web-based Clients in order to maximize efficiency and reach.

## Supporting The Web Browser

We now know that our backend will serve the client-side application code to the web-browser and it will run.

Our client-side application will use our backend API to send and receive data to and from the backend. This data will be used by client to update the UI in a seamless and automatic fashion.

## Supporting Multiple Clients

Suppose you wanted to make an Android and iPhone application. You'd need to create **Client** side code that can run on these specific environments, but that doesn't mean you have to completely recreate your server-side application from scratch. Your client-side Android/iPhone app can use _the same_ exact API endpoints to bring the necessary data and core features from your backend into the native mobile client-application environment.

In this way your web application can support multiple native client **frontends** for the web browser, iPad, Android, iPhone experiences, but use the same solid API to connect back to _one_ universal backend.

## Supporting Third-Party Clients

What if _another_ web application's server-side or client-side application tried to access your backend's API?

Conceptually speaking, the backend need not care whether the requesting application is owned by your company or whether it is a third-party application.

Third-party applications are free to access your data using your API provided your API is public.
Alternatively, for sensitive data, you can design an API that requires _authentication_ from the client-side application. This way clients and users of those clients may gain access only after providing client-level and/or user-level authentication credentials respectively.

### Virality

Empowering third-party applications to use your applications API is the essence of the social sharing phenomenon. Think of all the Youtube videos that are _not_ on Youtube but rather embedded in other websites. There are Twitter widgets to embed tweets, Amazon let's you list items for sale on your website, Google provides widgets to track page visits and provide website-specific search entirely within your website.

Ever see a list of your Facebook friends on websites or applications that you've used? The application is pulling in your friend list from Facebook's Open Graph API.

You can see how _extremely powerful_ a public API can be to share and promote your application throughout the entire Internet.

A well-designed public API is therefore crucial not only for efficiency but for the marketability of modern web applications.

Righto! We've covered all about how web applications work, the components that power them and how they are designed. Now we'll learn how to make them.


#  Building Web Applications

## Backend Components

- web server
  - distrubuted computing (CLOUD)
  - load balancer (reverse proxy)
  - proxy caching (varnish)
- application layer
  - server languages
    - Language types
      - Object oriented
      - blocking/non-blocking
      - functional
    - frameworks
- database layer
- caching layer
- CDN
- job servers (mail, cron jobs etc)
  
## Frontend Components

- media
- text/html/css
- data json/xml
- code - javascript
  
  
#  Hosting Web Applications

## Shared

Shared hosting is the cheapest paid hosting you can get.
You are literally sharing one server with potentially hundreds of different websites.

One server only has so many resources so if one of those websites gets an influx of traffic
that stalls the server, all websites will experience the same stall. If one website exposes 
a security vulnerability all websites on the server are at risk.
Needless to say you should probably avoid a shared server for any business related application.

## Virtual Private Server (VPS)

A virtual private server places multiple web applications onto one physical server _but_
they are privatized virtually, through software.

So physically you still share the same server with others, but you are free to download
your own Operating system and any and all necessary software packages to run.
Each virtual instance also has pre-allocated cpu and memory dedicated to _only_ that instance.

A VPS solves all the bandwidth and security issues with the traditional shared server.

VPS offer the most bang for the buck. They are extremely inexpensive for all the power they offer.
The one drawback is that a vps must be configured by someone who knows how to setup a web-server and all of its requisite dependencies.

## Dedicated Server

A dedicated server is one physical server dedicated entirely to your application.
You are leasing the physical hardware as housed in a data-center and a free to do what you wish with it.

This option offers the most control over every aspect of your application stack (including the physical hardware)
but of course it will cost more initially to setup and maintain.

## Cloud Servers

Cloud servers can be thought of as a large army of virtual private servers.
We know that a web application backend may be composed of many servers serving different roles.

Cloud servers main benefit is that they provide _on demand_ deployment of virtual private servers to your backend cluster.
Cloud servers can be cloned literally in minutes, booted, and then deployed live.

## Infrastructure as a Service

Cloud servers are a _type_ of infrastructure as a service. 
That is a company is providing you with access to raw infrastructure computers: computing power, dns routing, database layer, text and email sending.

Iaas is very affordable but comes with a necessary caveat that you must have a 
knowledgable engineer configure all the components together in an efficient cost effective manner.

## Platform as a Service

Platforms as a Service try to solve the "knowledgable engineer" problem by completely
removing the need for your company to worry about the Backend infrastructure entirely.

The premise is that engineers need only build the application layer, then push it to the PAAS
for hosting. Literally _everything_ else at this stage is taken care of.
Load balancing, caching, dynamic generation of application server nodes, the database layer, it's all provided!

This is perhaps the fastest way to get a prototype up and running.
However PAAS is not a silver bullet. It works best when your application is already very very efficient.
PAAS customers pay for all the computing power they use so while everything is taken care of, if your app is inefficient,
your bill will climb very high very fast.

As your company matures, you'll likely _require_ the control that comes with dedicated machines
and highly skilled system administrators that are experienced in squeezing every ounce of computing power out of each and every machine.

PAAS is _unmatched_ for getting prototypes up and running and deferring complex infrastructure problems until they are really warranted,
when you have a thousand customers knocking down your door trying to pay you money.

When that time comes your best bet is to reference this book while scheduling meetings with
experienced system administrators =)


#  Frequently Asked Questions

- How do I start?
- What are some ways my startup can save money?
- Are there shortcuts you can take, like using web app building frameworks?
