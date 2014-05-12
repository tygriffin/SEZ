class QuizzesController < ApplicationController

  def show
    @quiz = QuizDecorator.new Quiz.find(params[:id])

    gon.target_vocab = @quiz.target_vocab
    gon.option_vocab = @quiz.option_vocab
  end
end
