class QuizPresenter < ApplicationPresenter

  def related
    if @object.article_id
      Quiz.where(:article_id => @object.article_id).where('id != ?', @object.id)
    else
      Quiz.where(:topic_id => @object.topic_id).where('id != ?', @object.id)
    end
  end

  def target_vocab
    FlashcardVocab.where(:quiz_id => @object.id, :vocab_type => "target") if @object.quiz_type == "flashcard"
  end

  def option_vocab
    FlashcardVocab.where(:quiz_id => @object.id) if @object.quiz_type == "flashcard"
  end

end