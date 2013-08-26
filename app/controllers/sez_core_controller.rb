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
    unless mobile_device?
      @local_stylesheet = "static_page.css"
    end
    @title = "About"
  end

  def contribute
    unless mobile_device?
      @local_stylesheet = "static_page.css"
    end
    @title = "Contribute"
  end

  def game
    unless mobile_device?
      @local_stylesheet = "game.css"
    end
    @title = "Quiz Game"

    @quiz = Quiz.find(params[:id])
    if @quiz.article_id
      @related_quizzes = Quiz.where(:article_id => @quiz.article_id).where('id != ?', @quiz.id)
    else
      @related_quizzes = Quiz.where(:topic_id => @quiz.topic_id).where('id != ?', @quiz.id)
    end

    @article = Article.find(@quiz.article_id)
  end

end
