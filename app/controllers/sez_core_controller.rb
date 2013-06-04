class SezCoreController < ApplicationController

  #check for mobile
  before_filter :check_for_mobile

  def index
    @title = "Home"
    @local_stylesheet = "home.css"
    @features = Article.where(:pubtype => "feature").order("pubdate DESC").limit(6)
    #Generate a feature in focus randomly
    random = rand(6)
    @in_focus = @features[random]
    @features.delete_at(random)

    @posts = Article.where(:pubtype => "blog").order("pubdate DESC").limit(4)
  end

  def about
    @title = "About"
  end

  def archive
    @title = "Archive"
    @local_stylesheet = "archive.css"
    @articles = Article.all(:order => "pubdate DESC", :limit => 50)
  end

  def contribute
    @title = "Contribute"
  end

end
