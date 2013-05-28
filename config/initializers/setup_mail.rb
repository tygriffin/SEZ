ActionMailer::Base.smtp_settings = {
  :address              => "mail.simpleenglishzine.com",
  :port                 => 26,
  :domain               => "simpleenglishzine.com",
  :user_name            => "info@simpleenglishzine.com",
  :password             => "xVYiKVj3XzmK66Vy",
  :authentication       => :plain,
  :enable_starttls_auto => true,
  :openssl_verify_mode  => OpenSSL::SSL::VERIFY_NONE
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"