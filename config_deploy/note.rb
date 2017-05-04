Source
0.Railscasts Episode 133: Capistrano Tasks
  https://www.youtube.com/watch?v=L2zoi5NgXJg
1.Ruby on Rails - Railscasts PRO #133 Capistrano Tasks 
  https://www.youtube.com/watch?v=UQj_01dnEiw&t=385s
2.Ruby on Rails - Railscasts PRO #337 Capistrano Recipes (pro)
  https://www.youtube.com/watch?v=uXla2yyzH_8&t=560s

##### 0. Structure  #####
Dir structure
  myapp/release
  myapp/current ->
  myapp/shared ->

cap staging|production deploy
It calls the following task
  deploy:update_code
  deploy:sym_link
  deploy:restart

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

handle password for remote sudo 
    
##### 5. source code  #####
lib/capistrano/recipes
