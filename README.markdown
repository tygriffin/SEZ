Simple English Zine
===================

This project was a magazine written in simple language for Japanese learners of English, but now I use it primarily for my web development portfolio. I made it using Rails. And by the way, I did all the illustrations!

Skills I'm showing off:
-----------------------

+ Ruby on Rails!
+ Coffeescript! [peek the code!](https://github.com/tygriffin/SEZ/blob/master/app/assets/javascripts/popup_bubble.js.coffee)
+ From scratch sassy styling! [peek the code](https://github.com/tygriffin/SEZ/blob/master/app/assets/stylesheets/desktop/components/catalog.css.scss)
+ Decorator patter! [peek the code](https://github.com/tygriffin/SEZ/blob/master/app/decorators/article_decorator.rb)
+ All [illustrations](http://simpleenglishzine.com/article/a-picture-of-solidarity-yuri-kochiyama) were drawn by me!

Where to check the live app:
----------------------------

[SimpleEnglishZine.com](http://simpleenglishzine.com)

So is this app good?
--------------------

This was my first Rails app, so there are some weird design decisions in there. For example, I use `has_many` relation to describe tags in article. Of course, now I would use a `has_many :through` on a join table for something like that.

Also, I'm detecting the user agent to deliver a mobile specific stylsheet manifest to mobile users. That's something I don't think I ever want to do again.

Although there are some flaws, I have spruced up this app recently, so I think it represents my work pretty well. The code is readable and well organized. Check it out!

