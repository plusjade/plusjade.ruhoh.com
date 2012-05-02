---
title : Home
description:

layout : page
---

# Purpose

#### Business developers and Marketers

- **Bring your product to market faster and cheaper.**  
  by learning what parts of your app truly matter and what can be scaled up later by a third party
- **Make better leadership decisions.**  
  by educating yourself in industry best-practices
- **Make better long-term financial decisions**  
  by focusing on the core aspects that make your app unique and offloading everything else to a scalable solution.
- **Improve team dynamics**  
  by being on the same page with your development team, and empathizing with the challenges they face.
- **Learn from the best.**  
  Understand the core principles behind successful technology services and apply them to your infrastructure starting tomorrow.

# Goals

# Getting Started

- Who, what, where, why, when
- Problems and solutions
- Sample Startup Project

What is a web application? Let's break that question down into its core parts:

# What is an Application?

An application is a computer software program designed for the user to perform a task. 
Microsoft Excel, Microsoft Word, and Photoshop are common examples of _desktop_ applications.

Applications may run in many different environments such as desktops, laptops, smartphones, and tablet computers.
Google, Facebook and Twitter are examples of applications that primarily run through the _internet_. There are also _mobile_ applications that download and run on your smartphone or tablet device.


It is important to note that applications must be built _specifically for each environment_ they intend to run on.
Creating an app that runs on an android phone will not run on an iphone or on your laptop.

However there is one element common to all the environments we've mentioned;  they are all connected to the Internet.
Therefore it becomes possible to build a _web_ application in such a way that it becomes accessible across multiple environments just by virtue of being online!

So a _web_ application is an application that works entirely through the Internet and can potentially be accessed through multiple environments? Sounds great!
But first let's make sure we understand what the Internet is...

# What is the Web?

In a nutshell the Internet is a network of computers. 
Any computer can be connected directly or indirectly to the Internet. 

The computers connected to the Internet can make certain content publicly accessible to other computers in the network (the Internet).
They can also receive content that other computer's make available.

A **server** is a computer that has been tuned to serve content on the Internet in an efficient manner.
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

iphone and android "apps" are good examples of native applications that must be manually installed to a user's smartphone.

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
- IOS (iphone, ipad, itouch) mobile devices
- android mobile devices

This makes it clear to see that programming a web application for the web browser client is a very effective way to reach the most users.


      [desktop app]  [iphone]  [ipad]  [web browser]
        |         |          |
    ------------------------------------------------ Internet
        |          |            |
    [Server]    [Server]     [Server]



## The Server

Web applications leverage the Internet to send and receive media, data, and code.

Modern web applications are capable of updating themselves by looking for version updates on the Internet. Images, audio, video, and text files can all be created, updated, and saved back and forth between the application and the Internet. One of the most valuable aspects of a web application is the collaboration aspect. The ability for the application to connect to other users, and their content.

The second component that makes this possible is the Server. The server is responsible for maintaining, sending, and receiving all the data necessary to make the application work through the Internet.

You can think of a Server as a big central repository of information and computing power. 

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

Here's a contrived example:

    http://www.myapp.com/notes
    http://www.myapp.com/notes/add
    http://www.myapp.com/notes/1
    http://www.myapp.com/notes/1/delete

Notice the different URLs relative to the main domain name: http://www.myapp.com

    /notes            - show a list of all notes
    /notes/add        - add a note by sending text to this URL
    /notes/1          - show a single note identified by ID 1
    /notes/1/delete   - delete the note having ID 1
    

    [diagram: Facebook interactions between client and server]

All user-facing web applications work this way. Servers can provide an unlimited number of special endpoints to the application by way of the URLs.
You visit your friend's facebook page by navigating to a specific URL.
You can post messages on their wall by having the client send your text to a URL of that friend's wall.


# Web Application Design

We've covered the relationship between **Client**, **Internet**, and **Server**.
We've learned that the Servers provide application functionality and resources by means of URL endpoints to the various Clients via the Internet.

So just how exactly do we design our application? What exactly goes on the Server? How do we provide the Client with our URL endpoints and coded programs? Let's find out.

  
## Backend

The **backend** is a developer term used to describe all the **Server** related components in a web application.
Modern web applications actually use _many_ servers applied in a wide range of configuration formats as we'll cover later.

The backend is responsible for serving up the necessary content required to run your web application.
This content may consist of:

- media
  Images, videos, music files, pdfs, downloadable media documents
  can all be sent over the internet to available clients.
- text/html/css
- data (json/xml)
- code (javascript)

## Frontend

The "frontend" is a developer term used to describe all the **client** related components of a web application.
When the backend sends data to the client, it is the client's job to _process and render_ this data into what the end-user sees.

This book will focus on the Web Browser as it's primary client.

When media such as images, audio, video, and documents are sent to a web browser
the browser either displays them, streams them or makes them available for direct download.

Primarily a web browser renders web pages. Web pages consists of

- media files (images)
- HTML with textual content providing structure.
- CSS used to aesthetically style and layout the web page
- javascript - programming instructions capable of executing on the client end.
- raw data

All five types of information are responsible for making a modern web application.


When a client makes a web request to a domain, the request is actually _many requests_.
Some pages send html, some css, images, javascript etc.
All the web requests feed into the main web "document".
You can think of the Document as your application canvas. The document builds 
its environment using the content it receives from all its web requests.


With so many different types of content coming in, it would seem pretty complex
to design an application to support many types of web Clients.
We need to design a sane strategy for dealing with so many things going on.



## Bridge or API

The "bridge" is not a formal developer term.
The bridge is meant to describe how exactly the **Backend** manages to integrate
in a reliable way with the **client**. The bridge is largely conceptual.

The technical term for this much needed integration point is something you will hear a lot.
It is called the web application's **API** or application programming interface.

We've learned that the backend integrates with clients by means of different URLs. 
The URL scheme is a good and necessary part of an API but we need to be even more specific
about _how the content is structured_ both when sent to the client and received by the client.

The API provides standardized integration points between your application (and all it's data) and 
the outside world, most typically the clients we've talked about.

    [diagram: example of an API request/response cycle]
    

# API Design
    
Modern web applications make extensive use of APIs because it more efficient strategy for 
serving applications to a wide and varying degree of clients.

So far we've only talked about the Web browser as a client. Web browsers make asynchronous background requests
to your applications API, in order to efficiently update the user interface.

Since the web browser is executing code it receives from your server, what if it received code
from another server (another website) but the code wanted to access your public API's to fetch your data?

This is the essence of social sharing. By providing a public API to your web application, you can empower
third party websites to interact with (and ultimately promote) your application via widgets, plugins, streams, etc.
It's how users embed tweets, youtube videos, music, profiles etc all throughout the web and it is _extremely powerful_
way to promote your application.

This is _only_ possible by means of a well-formed API.

## Multi Client Support

Suppose you wanted to make an android and iphone application.
You'd need to create **client** side code that can run on these specific environments.
But that doesn't mean you have to completely recreate your app from scratch.
Your client-side android/iphone app can use _the same_ exact API endpoints to bring the necessary 
data and core features from your backend into the native mobile environment.

So you can see that although you may choose to build a variety of native **frontends**
for the web browser, ipad, android, iphone experiences, 
you can also build a well-formed **bridge** or API between all of these clients to only _one_ universal backend.

Righto! We've covered all about how web applications work and the components that power them.

Now we'll learn how to make them.


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
