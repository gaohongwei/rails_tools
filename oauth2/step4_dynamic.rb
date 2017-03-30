https://github.com/omniauth/omniauth/wiki/setup-phase

This is a documentation stub and should be expanded. Feel free to help make it more robust!

The setup phase exists to allow for request-time modification of an OmniAuth strategy. Here's how you might use it for Twitter auth on a Rack app:

SETUP_PROC = lambda do |env| 
  request = Rack::Request.new(env)
  user = User.find_by_subdomain(request.subdomain)
  env['omniauth.strategy'].options[:consumer_key] = user.consumer_key
  env['omniauth.strategy'].options[:consumer_secret] = user.consumer_secret
end
   
use OmniAuth::Builder.new do
  provider :twitter, :setup => SETUP_PROC
end
As you can see, you can pass a Proc (or anything that responds to call) to the :setup option when you specify a strategy and it will be called before the request and callback phases. Here you will have access to the running strategy via env['omniauth.strategy'] and you can modify it how you like.

Here's another example of using Facebook auth on a Rails app that uses a helper to return an ActiveRecord object with attributes of the current domain:

include ApplicationHelper

SETUP_PROC = lambda do |env|
  req = Rack::Request.new(env)
  # Note client_id & client_secret for Facebook
  env['omniauth.strategy'].options[:client_id] = current_domain(req).fb_app_id
  env['omniauth.strategy'].options[:client_secret] = current_domain(req).fb_app_secret
end

# Note the below block is different for a Rails app
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, setup: SETUP_PROC
end
You can use setup phase without block – it will work too if setup option is found. In Rails app you pass setup option like this:

Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :facebook, Config['appKey'], Config['appSecret'], :setup => true
end
and omniauth will look for route like '/auth/:provider/setup' which you can match to SessionsController for example:

match '/auth/:provider/setup' => 'sessions#setup'
In SessionsController#setup you can manage request options like this:

class SessionsController < ApplicationController
  def setup
    # in this example facebook keys for different site domains are stored in Config   
    request.env['omniauth.strategy'].options[:client_id] = Config[domain]['appKey']
    request.env['omniauth.strategy'].options[:client_secret] = Config[domain]['appSecret']
    render :text => "Omniauth setup phase.", :status => 404
  end
end
