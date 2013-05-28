class ContactController < ApplicationController

  def new
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
