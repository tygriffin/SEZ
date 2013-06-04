class TopicController < ApplicationController
  def show
    @topic = Topic.find(params[:id])
    @title = @topic.name
    @articles = Article.where(:topic_id => @topic.id)
    @description = markdown_parse(@topic.description)
  end
end
