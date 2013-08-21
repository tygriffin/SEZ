class SezCoreController < ApplicationController

  #check for mobile
  before_filter :check_for_mobile

  def index
    @title = "Home"
    unless mobile_device?
      @local_stylesheet = "home.css"
    end
    @articles = Article.find(:all, :order => "pubdate DESC", :limit => 6)
  end

  def about
    @title = "About"
  end

  def contribute
    @title = "Contribute"
  end

end
