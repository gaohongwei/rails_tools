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

=> {
 "setup"=>false,
 "skip_info"=>false,
 "client_id"=>"65159057968.65161186374",
 "client_secret"=>"dfbbd5c6947b3cd0c2c209ca278bd885",
 "client_options"=>{
   "site"=>"https://slack.com", 
   "token_url"=>"/api/oauth.access"
  },
 "authorize_params"=>{"state"=>"pan--e9496887ff09da1910800ca51117d647fd7edf8a70966973"},
 "authorize_options"=>[:scope, :team],
 "token_params"=>{},
 "token_options"=>[],
 "auth_token_params"=>{"mode"=>:query, "param_name"=>"token"},
 "provider_ignores_state"=>false,
 "name"=>"slack",
 "scope"=>"discovery:read discovery:write"
}

  option :client_options, {
    :site          => 'https://login.salesforce.com',
    :authorize_url => '/services/oauth2/authorize',
    :token_url     => '/services/oauth2/token'
  }#salesforce
  option :authorize_options, [
    :scope,
    :display,
    :immediate,
    :state,
    :prompt
  ] #salesforce
  option :authorize_params, {
    resource: 'https://graph.windows.net/'
  } #Office365

client_id, client_secret, scope can be defined in
initialize/omniauth.rb

      option :client_id, nil # default_options[client_id] = nil
      option :client_secret, nil
      option :client_options, {}
      option :authorize_params, {}
      option :authorize_options, [:scope]
      option :token_params, {}
      option :token_options, []
      option :auth_token_params, {}
      option :provider_ignores_state, false

    option :authorize_options, [:scope, :team]

    option :auth_token_params, {
      mode: :query,
      param_name: 'token'
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
# Sample definitions
option :authorize_options, [:scope, :team] #slack
