class TopicController < ApplicationController

  def show
    unless mobile_device?
      @local_stylesheet = "topic.css"
    end
    @topic = Topic.find(params[:id])
    @title = @topic.name
    @articles = Article.where(:topic_id => @topic.id).order("pubdate DESC").limit(20)
  end

end
