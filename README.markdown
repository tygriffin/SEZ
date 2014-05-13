Simple English Zine
===================

This project was a magazine written in simple language for Japanese learners of English, but now I use it primarily for my web development portfolio. I made it using Rails. And by the way, I did all the illustrations!

Where to check the live app:
----------------------------

[SimpleEnglishZine.com](http://simpleenglishzine.com)

So is this app good?
--------------------

This was my first Rails app, so there are some weird design decisions in there. For example, I use `has_many` relation to describe tags in article. Of course, now I would use a `has_many :through` on a join table for something like that.

Also, I'm detecting the user agent to deliver a mobile specific stylsheet manifest to mobile users. That's something I don't think I ever want to do again.

Although there are some flaws, I have spruced up this app recently, so I think it represents my work pretty well. The code is readable and well organized. Check it out!

