

adduser  web # ubuntu

Add a User to Multiple Groups
#ubuntu, centos
usermod -a -G rvm <username>
usermod -a -G ftp,admins,othergroup <username>
usermod -a -G rvm web


Add this to profile
[[ -s /usr/local/rvm/scripts/rvm ]] && source /usr/local/rvm/scripts/rvm
https://rvm.io/rubies

#install rvm and lastest ruby
rvm list known
rvm list 


curl -L https://get.rvm.io | sudo bash -s stable --ruby  # non root
curl -L https://get.rvm.io | bash -s stable --ruby  # with root

rvm install 2.1.1
rvm use ruby-2.1.1
rvm remove ruby-2.1.1
rvm use 1.9.3
rvm use 2.1.1

rvm gemset create rails410 rails320 # create a gemset
 
rvm 2.1.2@rails410  # specify Ruby version and our new gemset
gem install rails -v 4.03   # install specific Rails version
gem install rails -v 4.1.0


rvmrc
There are three different kinds of rvmrc files:
System wide configuration: /etc/rvmrc
User wide configuration: ~/.rvmrc
Project wide configuration:  .rvmrc

The most interesting one is the project .rvmrc. 
Every time you cd, RVM looks for a file called .rvmrc. 
If it finds it, it executes it.
