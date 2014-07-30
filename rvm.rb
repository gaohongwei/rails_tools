

https://rvm.io/rubies

Add this to profile
[[ -s /usr/local/rvm/scripts/rvm ]] && source /usr/local/rvm/scripts/rvm

rvm list 
rvm list known
rvm install 2.1.1
rvm use ruby-2.1.1
rvm remove ruby-2.1.1

rvmrc
There are three different kinds of rvmrc files:
System wide configuration: /etc/rvmrc
User wide configuration: ~/.rvmrc
Project wide configuration:  .rvmrc

The most interesting one is the project .rvmrc. 
Every time you cd, RVM looks for a file called .rvmrc. 
If it finds it, it executes it.
