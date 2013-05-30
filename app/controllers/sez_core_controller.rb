class SezCoreController < ApplicationController

  #check for mobile
  before_filter :check_for_mobile

  def index
    @title = "Home"
    @local_stylesheet = "home.css"
    @articles = Publication.where(:pubtype => "article").order("pubdate DESC").limit(6)
    #Generate a featured article randomly
    random = rand(6)
    @featured = @articles[random]
    @articles.delete_at(random)

    @posts = Publication.where(:pubtype => "blog").order("pubdate DESC").limit(4)
  end

  def about
    @title = "About"
  end

  def archive
    @title = "Archive"
    @local_stylesheet = "archive.css"
    @articles = Publication.where(:pubtype => "article").order("pubdate DESC")
  end

  def contribute
    @title = "Contribute"
  end

  def blog
    @title = "Blog"
    @local_stylesheet ="blog.css"
    @posts = Publication.where(:pubtype => "blog").order("pubdate DESC").limit(20)
  end
end
