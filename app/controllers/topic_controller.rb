class TopicController < ApplicationController

  def show
    @local_stylesheet = "topic.css" unless mobile_device?
    @topic = Topic.find(params[:id])
    @title = @topic.name
    @articles = Article.where(:topic_id => @topic.id).order("pubdate DESC").limit(20)
  end

end
