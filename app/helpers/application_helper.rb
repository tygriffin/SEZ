module ApplicationHelper
  # Return a title on a per-page basis.
  def title
    base_title = "SEZ"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def local_stylesheet
    if @local_stylesheet
      "#{local_stylesheet}"
    end
  end

end
