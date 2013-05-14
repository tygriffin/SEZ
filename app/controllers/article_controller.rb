class ArticleController < ApplicationController

  def index
  end

  def show
    @article = Article.find(params[:id])
    @body = markdown_parse(@article.body, {:escape_html => false, :strict_mode => false,})
    @title = @article.title
    @vocabulary_words = VocabularyWord.all(params[:article_id => :id])

    if @vocabulary_words
      @vocabulary_words.each do |entry|
        if @body.include? entry.instance
          text = '<span class="vocab_bubble_wrapper"><a href="#' + entry.word.tr(" ", "_") + '_detail"  class="vocab_bubble_trigger" id="' + entry.word + '">' + entry.instance + '</a></span>'
          @body.gsub!(entry.instance, text)
        end
      end

      gon.vocab = @vocabulary_words
    end

  end
end
