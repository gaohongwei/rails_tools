  ########## Step 1 request_phase ##########
  def request_phase # OAuth2
    redirect client.auth_code.authorize_url({:redirect_uri => callback_url}.merge(authorize_params))
  end
  
  def authorize_params# OAuth2
    options.authorize_params[:state] = SecureRandom.hex(24)
    params = options.authorize_params.merge(options_for("authorize"))
    if OmniAuth.config.test_mode
      @env ||= {}
      @env["rack.session"] ||= {}
    end
    session["omniauth.state"] = params[:state]
    params
  end  
  
  # redirect client.auth_code.authorize_url accepts a hash  such as
  # {redirect_uri: redirect_uri, stat: 'stat'}
  
  Subclass may need to redefine authorize_params 
  def authorize_params
    {redirect_uri: redirect_uri, stat: 'stat'}
  end
  
  Subclass may need options authorize_options attributes
  options_for("authorize") will read these key-value pair.
  option :authorize_options, [:scope, :team] #slack

  def options_for(option)# OAuth2
    hash = {}
    options.send(:"#{option}_options").select { |key| options[key] }.each do |key|
      hash[key.to_sym] = options[key]
    end
    hash
  end
