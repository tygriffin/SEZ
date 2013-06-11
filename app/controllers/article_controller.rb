class ArticleController < ApplicationController

  #check for mobile
  before_filter :check_for_mobile

  def show
    if mobile_device?
      @local_stylesheet = "article_mobile.css"
    else
      @local_stylesheet = "article.css"
    end
    @article = Article.find(params[:id])
    @title = @article.title
    @body = markdown_parse(@article.body, {:escape_html => false, :strict_mode => false,})
    @vocabulary_words = VocabularyWord.where(:article_id => @article.id).order("word")
    @culture_notes = CultureNote.where(:article_id => @article.id).order("title")

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

    #Facebook Open Graph
    @og_title = @article.title
    @og_url = request.host_with_port + request.fullpath
    @og_image = request.host_with_port + @article.image_url(:thumb)
    @og_description = @article.description

  end

  def feed
    @title = "SEZ"
    @articles = Article.order("pubdate DESC")
    @updated = @articles.first.updated_at unless @articles.empty?

    respond_to do |format|
      format.atom { render :layout => false }

      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end


end



