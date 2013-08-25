class QuizzesController < ApplicationController
  def index
  end

  def show
    @quiz = Quiz.find(params[:id])

    case @quiz.quiz_type
    when "flashcard"
      @target_vocab = FlashcardVocab.where(:quiz_id => @quiz.id, :vocab_type => "target")
      @option_vocab = FlashcardVocab.where(:quiz_id => @quiz.id)
    end

    gon.target_vocab = @target_vocab
    gon.option_vocab = @option_vocab
  end
end
