class NotificationsMailer < ActionMailer::Base
  default :from => "info@tayloryuengriffin.com"
  default :to => "info@tayloryuengriffin.com"

  def new_message(message)
    @message = message
    mail(:subject => "[SEZ] #{message.subject}")
  end

end
