class ApplicationController < ActionController::Base
  protect_from_forgery

  def markdown_parse(str, options={})
    options = {
      :escape_html => false,
      :strict_mode => false,
    }.update(options)
    bc = BlueCloth.new(str, options)
    bc.to_html
  end
end
