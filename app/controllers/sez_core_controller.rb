class SezCoreController < ApplicationController
  def index
    @title = "Home"
    @local_stylesheet = "home.css.scss"
    @articles = Article.find(:all, :limit => 6, :order => "pubdate DESC")
    #Generate a featured article randomly
    random = rand(6)
    @featured = @articles[random]
    @articles.delete_at(random)

    @posts = Post.find(:all, :limit => 4)
    @posts.each do |post|
      post.body = markdown_parse(post.body)
      post.body = post.body.truncate(200, :separator => ' ')
      if post.body.include?('<a')
        post.body = post.body.slice!(0..(post.body.index('<a')))[0..-2]+"..."
      end
    end
  end

  def about
    @title = "About"
  end

  def archive
    @title = "Archive"
    @articles = Article.all(:order => "title")
  end

  def contribute
    @title = "Contribute"
  end

  def blog
    @title = "Blog"
    @posts = Post.all
  end
end
