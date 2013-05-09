class ArticleController < ApplicationController
  def index
  end
  def show
    @article = Article.find(params[:id])
    @body = markdown_parse(@article.body, {:escape_html => false, :strict_mode => false,})
    @title = @article.title
  end
end
