# Set user and email for single  project
git init
git config user.name "Gaohong Wei"
git config user.name
git config user.email "gaohongwei@gmail.com"
git config user.email

# Set user and email globally
git init
git config --global user.name "Gaohong Wei"
git config --global user.name
git config --global user.email "gaohongwei@gmail.com"
git config --global user.email


ssh-keygen -t rsa
ssh-copy-id remote_host
ssh -p port_number remote_host
ssh remote_host command_to_run

Testing your SSH connection
ssh -T git@github.com

git push origin master --usernamessh -p port_number remote_host
ssh remote_host command_to_run


git clone https://gaohongwei@github.com/gaohongwei/rails_topics

Checkout specific files from another branch
git checkout development -- Gemfile
git checkout development -- Gemfile.lock
