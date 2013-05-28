class NotificationsMailer < ActionMailer::Base
  default :from => "info@simpleenglishzine.com"
  default :to => "info@simpleenglishzine.com"

  def new_message(message)
    @message = message
    mail(:subject => "[SEZ] #{message.subject}")
  end

end
