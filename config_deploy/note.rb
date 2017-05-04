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

##### 2. update vaibales  #####
Set variables


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
