class SezCoreController < ApplicationController

  before_action :check_for_mobile

  def index
    @title = "Home"
    @articles = Article.order("pubdate DESC").limit(6)
  end

  def about
    @title = "About"
  end

  def contribute
    @title = "Contribute"
  end

  def game
    @title = "Quiz Game"

    @quiz = QuizDecorator.new Quiz.find(params[:id])
  end

end
