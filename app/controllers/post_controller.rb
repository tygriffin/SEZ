class PostController < ApplicationController
  def index
  end

  def show
    @post = Publication.find(params[:id])
    @body = markdown_parse(@post.body)
  end
end
