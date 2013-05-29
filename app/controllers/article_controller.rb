class ArticleController < ApplicationController

  @articles = Publication.where(:pubtype => "article").order("pudate DESC").limit(20)
  respond_to do |format|
    format.rss { render :layout => false }
  end

  def index
  end

  def show
    @article = Publication.find(params[:id])
    @body = markdown_parse(@article.body, {:escape_html => false, :strict_mode => false,})
    @vocabulary_words = VocabularyWord.where(:publication_id => @article.id).order("word")
    @culture_notes = CultureNote.where(:publication_id => @article.id).order("title")

    if @vocabulary_words
      @vocabulary_words.each do |entry|
        if @body.include? entry.instance
          text = '<a href="#' + entry.word.tr(" ", "_") + '_detail"  class="article_bubble_trigger" id="' + entry.word + '">' + entry.instance + '</a>'
          @body.gsub!(entry.instance, text)
        end
      end

      gon.vocab = @vocabulary_words
    end

    if @culture_notes
      @culture_notes.each do |entry|
        if @body.include? entry.instance
          text = '<a href="#' + entry.title.tr(" ", "_") + '_detail"  class="article_bubble_trigger" id="' + entry.title + '">' + entry.instance + '</a>'
          @body.gsub!(entry.instance, text)
        end
      end

      gon.culture_notes = @culture_notes
    end

  end
end
