ActionMailer::Base.smtp_settings = {
  :address              => "mail.tayloryuengriffin.com",
  :port                 => 26,
  :domain               => "tayloryuengriffin.com",
  :user_name            => "info@tayloryuengriffin.com",
  :password             => "xVYiKVj3XzmK66Vy",
  :authentication       => :plain,
  :enable_starttls_auto => true,
  :openssl_verify_mode  => OpenSSL::SSL::VERIFY_NONE
}

ActionMailer::Base.default_url_options[:host] = "simpleenglishzine.com"