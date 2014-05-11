class QuizPresenter < ApplicationPresenter

  def related
    if @object.article_id
      Quiz.where(:article_id => @object.article_id).where('id != ?', @object.id)
    else
      Quiz.where(:topic_id => @object.topic_id).where('id != ?', @object.id)
    end
  end

end