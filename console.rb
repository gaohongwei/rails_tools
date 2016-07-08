
=============Use helper method
include ApplicationHelper

Print a Rails configuration in console
Rails.application.config.action_mailer
Rails.application.config.<your_variable>
Rails.application.config.instance_variables

=============Mongoid Config
Mongoid::Config.sessions => {"default"=>{"database"=>"aperture_development", "hosts"=>["localhost:27017"], "options"=>nil}}
Mongoid::Config.methods
