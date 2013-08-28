class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :topics_menu

  def topics_menu
    puts "hello"
    @topics_menu = Topic.find(:all, :order => "name")
  end
  helper_method :topics_menu

  def check_for_mobile
    session[:mobile_override] = params[:mobile] if params[:mobile]
    prepare_for_mobile if mobile_device?
  end

  def prepare_for_mobile
    prepend_view_path Rails.root + 'app' + 'views_mobile'
  end

  def mobile_device?
    if session[:mobile_override]
      session[:mobile_override] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  helper_method :mobile_device?


  def markdown_parse(str, options={})
    options = {
      :escape_html => false,
      :strict_mode => false,
    }.update(options)
    bc = BlueCloth.new(str, options)
    bc.to_html
  end
  helper_method :markdown_parse

  def add_flag(flag)
    if mobile_device?
      case flag
      when 'easy to read'
        flag_image = "/images/flag_easy-to-read_mobile.png"
      when 'short read'
        flag_image = "/images/flag_short_mobile.png"
      when 'challenge'
        flag_image = "/images/flag_challenge_mobile.png"
      when 'learn slang'
        flag_image = "/images/flag_slang_mobile.png"
      end
    else
      case flag
      when 'easy to read'
        flag_image = "/images/flag_easy-to-read.png"
      when 'short read'
        flag_image = "/images/flag_short.png"
      when 'challenge'
        flag_image = "/images/flag_challenge.png"
      when 'learn slang'
        flag_image = "/images/flag_slang.png"
      end
    end
  end
  helper_method :add_flag
end
