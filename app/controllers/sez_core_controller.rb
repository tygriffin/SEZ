class SezCoreController < ApplicationController
  def index
    @title = "Home"
    @articles = Article.find(:all, :limit => 5)
    @posts = Post.find(:all, :limit => 4)
  end

  def about
    @title = "About"
  end

  def archive
    @title = "Archive"
  end

  def contribute
    @title = "Contribute"
  end

  def blog
    @title = "Blog"
  end

  def contact
    @title = "Contact"
  end
end
