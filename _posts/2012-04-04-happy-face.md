---
title: happy face
description:
categories: random
tags: [ruby, motivation]

layout: post
---

## http://plusjade.ruhoh.com works!

Can you believe it? I'm pretty amazed by this. 

My first post is authentically one of just ...happiness. Yep pretty spiffy.

Let's test some code:

This is the sinatra route that handles GitHub's POST receive hook.  
Thanks GitHub &lt;3 &lt;3 &lt;3


    post '/' do
      payload = JSON.parse(params['payload'])
      repo = Repo.new(payload)

      halt("invalid GitHub payload") unless repo.valid?
      repo.deploy if repo.update
    end
    
    
    
## OH BOY!

 =)

[https://github.com/ruhoh/post.ruhoh.com](https://github.com/ruhoh/post.ruhoh.com)

On a side note, I probably really need to replace this Maruku markdown parser as I'm getting errors as I write this!