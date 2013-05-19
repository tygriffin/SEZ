class PostController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
    @body = markdown_parse(@post.body)
  end
end
