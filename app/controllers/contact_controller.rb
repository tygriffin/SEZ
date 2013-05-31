class ContactController < ApplicationController

  #check for mobile device
  before_filter :check_for_mobile

  def new
    @local_stylesheet = "contact.css"
    @message = Contact.new
  end

  def create
    @message = Contact.new(params[:contact])

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(contact_path, :notice => "Thank you for your message!")
    else
      render :action => 'new'
    end
  end

end
