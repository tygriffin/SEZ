class ArticlePresenter < ApplicationPresenter

  def author
    @object.author
  end

  def body
    markdown_parse @object.body
  end

  def vocab
    @object.vocabulary_words.order :word
  end

end