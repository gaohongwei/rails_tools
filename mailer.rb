export EMAIL=me@gmail.com
export PASSWORD=mypwd

view ./config/application.rb

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => ENV["EMAIL"],
  :password             => ENV["PASSWORD"],    
  :authentication       => "plain",
  :enable_starttls_auto => true
}
