class ArticleController < ApplicationController
  def index
  end
  def show
    @article = Article.find(params[:id])
    @title = @article.title
  end
end
