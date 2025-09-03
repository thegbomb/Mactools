#!/bin/sh
# ------------------------------------------------------------------
# [gareth alexander] Command line tools updates
#          Script to install command line tools
# ------------------------------------------------------------------

cd ~
sudo xcodebuild -license
xcode-select --install

# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
mkdir ~/.ssh && touch ~/.ssh/config
# ssh-keygen -t ed25519 -C "email@here.com"
# ssh-keygen -t rsa -b 4096 -C "email@here.com"
ssh-keygen -b 4096 -C "email@here.com"

cat >> "~/.ssh/config" <<END
Host *.acquia-sites.com
   HostKeyAlgorithms=+ssh-rsa
   PubkeyAcceptedKeyTypes=+ssh-rsa

Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
END
# ssh-add -K ~/.ssh/id_rsa
ssh-add --apple-use-keychain ~/.ssh/[your-private-key]
cat ~/.ssh/config

ssh-add -l -E md5
ssh-keygen -l -E md5 -f ~/.ssh/id_rsa
ssh-keygen -l -E md5 -f ~/.ssh/id_rsa.pub

# Copy keys and add to ssh keys sections of various repo sites.
# pbcopy < ~/.ssh/id_ed25519.pub
# pbcopy < ~/.ssh/id_rsa.pub

# Add keys to:
#
# https://bitbucket.org/account/settings/ssh-keys/
# ssh -T git@bitbucket.org
# https://github.com/settings/keys
# ssh -T git@github.com
# https://gitlab.com/-/user_settings/ssh_keys
# ssh -T git@gitlab.com
# ssh -T git@git.drupal.org
# ssh -T {{project_name}}@{{repo-id}}.prod.hosting.acquia.com

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/cask

brew update
brew doctor

brew install wget curl
# Use this if not using ddev to run php
#brew tap shivammathur/php
#brew install shivammathur/php/php@7.4
#brew install php@8.1 php@8.2 git composer
# brew unlink php && brew link --overwrite --force php@7.4
#brew unlink php && brew link --overwrite --force php@8.1
#brew install mariadb sqlite
#brew install ansible@2.9 npm nvm

#mkdir ~/.nvm

#cat >> ~/.bash_profile <<END
#export NVM_DIR="$HOME/.nvm"
#[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
#[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
#END
#cat ~/.bash_profile

touch ~/.zshrc
cat >> ~/.zshrc <<END
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile;
fi
END
source ~/.zshrc
cat ~/.zshrc

#brew install ruby
#sudo gem install compass

# Browsers
brew install --cask firefox chromedriver microsoft-edge
# brew install --cask chromedriver
brew install --cask google-chrome
brew install --cask lastpass 1Password

# Dev IDEs
brew install --cask pulsar phpstorm visual-studio-code

# Java (if required)
#brew install openjdk
#echo 'export PATH="/usr/local/opt/openjdk/bin:$PATH"' >> ~/.bash_profile
#ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
#brew install --cask netbeans

# Local development environments
# brew install --cask virtualbox vagrant
brew install --cask docker
open -a /Applications/Docker.app
# brew install --cask lando
brew install ddev/ddev/ddev
# One-time initialisation of mkcert
brew install mkcert
brew install nss # if you use Firefox
mkcert -install

# Productivity
#brew install --cask meld
brew install --cask sourcetree postman
brew install --cask dropbox
brew install --cask google-drive
brew install --cask onedrive

# Collaboration tools
brew install --cask slack
brew install --cask zoom
brew install --cask microsoft-teams
brew install --cask microsoft-outlook
brew install --cask microsoft-word
brew install --cask microsoft-word
brew install --cask microsoft-excel

# Notes tools
brew install --cask microsoft-onenote
brew install --cask evernote
#brew install --cask skitch

# Others
brew install --cask adobe-acrobat-reader
brew install --cask imageoptim
#brew install --cask sequel-ace
# brew install --cask tableplus
brew install --cask postman
brew install --cask screaming-frog-seo-spider
brew install --cask grammarly-desktop
brew install --cask spotify

# Optional tools
brew install --cask colour-contrast-analyser
brew install --cask git-credential-manager
brew install --cask obs
brew install --cask openvpn-connect
brew install --cask shottr
brew install --cask stats
brew install --cask vlc

# Code inspection tools
# https://gist.github.com/hassanjamal/c868f8808c06c4acfcf717c0b5bb01e1
brew install php-code-sniffer php-cs-fixer

# AI tools
# https://docs.anthropic.com/en/docs/claude-code/setup
brew install node
npm install -g @anthropic-ai/claude-code
brew install --cask claude
claude doctor

# Launchers
# https://github.com/drush-ops/drush-launcher
#curl -OL https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar
#chmod +x drush.phar
#sudo mv drush.phar /usr/local/bin/drush
#drush self-update

# https://github.com/acquia/blt-launcher
#curl -OL https://github.com/acquia/blt-launcher/releases/latest/download/blt.phar
#chmod +x blt.phar
#sudo mv blt.phar /usr/local/bin/blt

# Installing Acquia CLI
# https://docs.acquia.com/acquia-cli/install/
curl -OL https://github.com/acquia/cli/releases/latest/download/acli.phar
chmod +x acli.phar
mv acli.phar /usr/local/bin/acli
# Create a Cloud Platform API token at https://cloud.acquia.com/a/profile/tokens
acli auth:login
acli self-update --stable

brew cleanup
cd -

# Consider these browser extensions
#1Password – Password Manager
#The best way to experience 1Password in your browser. Easily sign in to sites, generate passwords, and store secure information.
#AWS Extend Switch Roles
#Extend your AWS IAM switching roles. You can set the configuration like aws config format
#axe DevTools - Web Accessibility Testing
#Accessibility Checker for Developers, Testers, and Designers in Chrome
#Consent-O-Matic
#Automatic handling of GDPR consent forms
#CSP Evaluator
#CSP Evaluator is a tool that allows developers to check if a Content Security Policy (CSP) serves as mitigation against XSS attacks.
#DrupalPod helper extension
#This extension sets up a development environment for Drupal contributions.
#Google Docs Offline
#Edit, create and view your documents, spreadsheets and presentations – all without Internet access.
#Window Resizer
#Resize the browser window to emulate various screen resolutions.
