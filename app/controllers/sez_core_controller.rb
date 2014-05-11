class SezCoreController < ApplicationController

  before_action :check_for_mobile

  def index
    @title = "Home"
    @local_stylesheet = "home.css" unless mobile_device?
    @articles = Article.order("pubdate DESC").limit(6)
  end

  def about
    @local_stylesheet = "static_page.css" unless mobile_device?
    @title = "About"
  end

  def contribute
    @local_stylesheet = "static_page.css" unless mobile_device?
    @title = "Contribute"
  end

  def game
    @local_stylesheet = "game.css" unless mobile_device?
    @title = "Quiz Game"

    @quiz = QuizPresenter.new(Quiz.find params[:id])
  end

end
