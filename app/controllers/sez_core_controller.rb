class SezCoreController < ApplicationController
  def index
    @title = "Home"
    @articles = Article.find(:all, :limit => 6)
    # Generate a featured article randomly
    random = rand(6)
    @featured = @articles[random]
    @articles.delete_at(random)

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
