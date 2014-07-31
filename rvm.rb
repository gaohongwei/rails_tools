

adduser  web # ubuntu

Add a User to Multiple Groups
#ubuntu, centos
usermod -a -G rvm <username>
usermod -a -G ftp,admins,othergroup <username>
usermod -a -G rvm web


Add this to profile
[[ -s /usr/local/rvm/scripts/rvm ]] && source /usr/local/rvm/scripts/rvm
https://rvm.io/rubies


curl -L https://get.rvm.io | bash -s stable --ruby
rvm list 
rvm list known
rvm install 2.1.1
rvm use ruby-2.1.1
rvm remove ruby-2.1.1
rvm use 1.9.3
rvm use 2.1.1
rvm gemset create gemset4
rvm gemset create gemset4    # create a gemset
rvm 2.1.1@gemset4  # specify Ruby version and our new gemset
gem install rails -v 4.03   # install specific Rails version


rvmrc
There are three different kinds of rvmrc files:
System wide configuration: /etc/rvmrc
User wide configuration: ~/.rvmrc
Project wide configuration:  .rvmrc

The most interesting one is the project .rvmrc. 
Every time you cd, RVM looks for a file called .rvmrc. 
If it finds it, it executes it.
