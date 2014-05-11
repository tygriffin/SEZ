class ArticleController < ApplicationController

  before_filter :check_for_mobile

  def show
    if mobile_device?
      @local_stylesheet = "article_mobile.css"
    else
      @local_stylesheet = "article.css"
    end

    @article = Article.find(params[:id])

    if request.path != article_path(@article)
      redirect_to @article, status: :moved_permanently
    end

    @title = @article.title
    @author = Author.find(@article.author_id)
    @body = markdown_parse(@article.body, {:escape_html => false, :strict_mode => false})
    @vocabulary_words = VocabularyWord.where(:article_id => @article.id).order("word")
    @culture_notes = CultureNote.where(:article_id => @article.id).order("title")
    @study_notes = StudyNote.where(:article_id => @article.id).order("title")

    @next_article = Article.where(['pubdate > ?', @article.pubdate]).order("pubdate").first
    @previous_article = Article.where(['pubdate < ?', @article.pubdate]).order("pubdate DESC").first

    if @vocabulary_words
      @vocabulary_words.each do |entry|
        if @body.include? entry.instance
          if mobile_device?
            text = '<a class="article_bubble_trigger" id="' + entry.word + '">' + entry.instance + '</a>'
          else
            text = '<a href="#' + entry.word.tr(" ", "_") + '_detail" class="article_bubble_trigger" id="' + entry.word + '">' + entry.instance + '</a>'
          end
          @body.gsub!(entry.instance, text)
        end
      end

      gon.vocab = @vocabulary_words
    end

    if @culture_notes
      @culture_notes.each do |entry|
        if @body.include? entry.instance
          if mobile_device?
            text = '<a class="article_bubble_trigger" id="' + entry.title + '">' + entry.instance + '</a>'
          else
            text = '<a href="#' + entry.title.tr(" ", "_") + '_detail"  class="article_bubble_trigger" id="' + entry.title + '">' + entry.instance + '</a>'
          end
          @body.gsub!(entry.instance, text)
        end
      end

      gon.culture_notes = @culture_notes
    end

    if @study_notes
      @study_notes.each do |entry|
        if @body.include? entry.instance
          if mobile_device?
            text = '<a class="article_bubble_trigger" id="' + entry.title + '">' + entry.instance + '</a>'
          else
            text = '<a href="#' + entry.title.tr(" ", "_") + '_detail"  class="article_bubble_trigger" id="' + entry.title + '">' + entry.instance + '</a>'
          end
          @body.gsub!(entry.instance, text)
        end
      end

      gon.study_notes = @study_notes
    end

    @quiz = Quiz.where(:article_id => @article.id, :quiz_type => 'flashcard').first

    #Social Media Meta
    @meta_title = @article.title
    @meta_url = "http://" + request.host_with_port + request.fullpath
    @meta_image = "http://" + request.host_with_port + @article.image_url(:main)
    @meta_description = @article.description

  end

  def create
    @article = Article.create article_params
  end

  def feed
    @articles = Article.order("pubdate DESC").limit(20)

    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  private

  def article_params
    params.require(:article).permit(:body, :description, :title, :image, :image_attribution, :pubdate, :audio, :pubtype, :figure, :tags_attributes, :topic_id, :author_id, :slug, :flag_message)
  end

end



