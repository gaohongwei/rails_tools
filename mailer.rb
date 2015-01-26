export EMAIL=me@gmail.com
export PASSWORD=mypwd

view ./config/application.rb
config.action_mailer.default_url_options = { :host => 'five9.com' }
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => ENV["EMAIL"],
  :password             => ENV["PASSWORD"],    
  :authentication       => "plain",
  :enable_starttls_auto => true
}

Or set up host/default_url_options and gmail account/password by the following way:
class ApplicationController < ActionController::Base
	before_filter :mailer_set_url_options

  def mailer_set_url_options
    # default_url_options Not working here. 
    # Have to move to config to work    
    #config.action_mailer.default_url_options = { host:'xietiao.herokuapp.com'}   
    #Or  request.host_with_port
    ActionMailer::Base.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => "gmail.com",
      :user_name            => ENV["EMAIL"],
      :password             => ENV["PASSWORD"],    
      :authentication       => "plain",
      :enable_starttls_auto => true
    }     
  end
end

