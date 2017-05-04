##### 1. Add gem  #####
Add gem

##### 2. Create files  #####
#capify
#cap install
SJCMACN2FBG8WN:zz kwei$ cap install
mkdir -p config/deploy
create config/deploy.rb
create config/deploy/staging.rb
create config/deploy/production.rb
mkdir -p lib/capistrano/tasks
create Capfile
Capified

##### 2. Define variables  #####
domain = "mydomain"
home = "/home/myuser"

set :domain, domain
set :home, home
set :deploy_to, "#{home}/#{domain}"

Alternatively, you can use fetch, the counterpart to set:
set :domain, "mydomain"
set :home, "/home/myuser"
set :deploy_to, "#{fetch(:home)}/#{fetch(:domain)}"

fetch can define a default variable
set :deploy_to, "#{fetch(:home)}/#{fetch(:domain, 'localhost')}"

##### 3. Create tasks  #####
similar to rake task
namespace :deploy do
  desc 'Hello get_code'
  task :get_code do
    puts 'get_code'
  end

  desc 'Hello build_asset'
  task :build_asset do
    puts 'build_asset'
  end

  after :get_code, :build_asset


##### 3. Run tasks  #####
cap -T
cap dev deploy:get_code
config/deploy/dev.rb must be defined

##### 4. Run command remotely  #####
Need to define
server, user, role
run a command, 
run "ls"
run "#{sudo} cp ~/hello /hello"

set :user, "deployer"
server '127.0.0.1', :web, :app, :db, :sms, :cache, primary: true
primary: true is used for db


role :web, '10.10.10.10', '10.10.10.11' # if many servers

##### 5. source code  #####
lib/capistrano/recipes
