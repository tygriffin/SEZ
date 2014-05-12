class ArticleController < ApplicationController

  before_action :check_for_mobile

  def show
    @article = ArticleDecorator.new Article.find(params[:id]), view_context

    gon.vocab         = @article.vocab          if @article.vocab
    gon.culture_notes = @article.culture_notes  if @article.culture_notes
    gon.study_notes   = @article.study_notes    if @article.study_notes

    #Social Media Meta
    @meta_title       = @article.title
    @meta_url         = "http://" + request.host_with_port + request.fullpath
    @meta_image       = "http://" + request.host_with_port + @article.image_url(:main)
    @meta_description = @article.description

  end

  def feed
    @articles = Article.order("pubdate DESC").limit(20)

    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

end



