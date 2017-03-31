def after_sign_in_path_for(resource)
  session['user_return_to'] || '/'
end

The default url to be used after signing in. 
This is used by all Devise controllers and you can overwrite it in your ApplicationController to 
provide a custom hook for a custom resource.

By default, it first tries to find a valid resource_return_to key in the session, 
then it fallbacks to resource_root_path, otherwise it uses the root path. 
For a user scope, you can define the default url in the following way:
