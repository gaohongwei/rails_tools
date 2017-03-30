=> {  
  "setup"=>false,
 "skip_info"=>false,
 "client_id"=>"client_id",
 "client_secret"=>"client_secret",
 "client_options"=>
    { 
      "site" => "abc.com",
      "authorize_url"=>"https://secure.sharefile.com/oauth/authorize",
      "token_url"=>"https://secure.sharefile.com/oauth/token"
     },
 "authorize_params"=>{},
 "authorize_options"=>[:scope],
 "token_params"=>{},
 "token_options"=>[],
 "auth_token_params"=>{},
 "provider_ignores_state"=>false,
 "name"=>"citrix"
}


  def options_for(option)# OAuth2
    hash = {}
    options.send(:"#{option}_options").select { |key| options[key] }.each do |key|
      hash[key.to_sym] = options[key]
    end
    hash
  end

#There are two calls
options_for('authorize')
options_for('token')
