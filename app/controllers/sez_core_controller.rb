class SezCoreController < ApplicationController
  def index
    @title = "Home"
    @articles = Article.all
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
