
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
