module ApplicationHelper

  def title
    base_title = "SEZ"
    @title.nil? ? base_title : "#{base_title} | #{@title}"
  end

  def local_stylesheet
    "#{local_stylesheet}" if @local_stylesheet
  end

end
