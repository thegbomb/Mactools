#!/bin/sh
# ------------------------------------------------------------------
# [gareth alexander] Command line tools updates
#          Script to install command line tools
# ------------------------------------------------------------------

cd ~
sudo xcodebuild -license
xcode-select --install

mkdir ~/.ssh && touch ~/.ssh/config
ssh-keygen -t rsa -b 4096 -C "email@here.com"
ssh-add -K ~/.ssh/id_rsa
nano ~/.ssh/config

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/cask

brew update
brew doctor

brew install wget curl
brew install php@7.4 php@8.0 git composer
brew install mariadb sqlite
brew install ansible@2.9 npm nvm

# Java (if required)
# brew install java
# sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

mkdir ~/.nvm
cat >> "~/.zshrc" <<END
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
END
cat "~/.zshrc"

brew install ruby
sudo gem install compass

# Browsers
brew install --cask firefox chromedriver 
brew install --cask lastpass 1Password

# Dev IDE
brew install --cask atom netbeans phpstorm

# Local development environments
brew install --cask virtualbox vagrant
brew install --cask docker
brew install --cask lando
brew install drud/ddev/ddev

# Productivity
brew install --cask meld sourcetree postman
brew install --cask dropbox
brew install --cask google-drive

# Collaboration tools
brew install --cask slack
brew install --cask zoom
brew install --cask microsoft-teams
brew install --cask microsoft-outlook

# Notes tools
brew install --cask evernote skitch

# Others
brew install --cask imageoptim
brew install --cask spotify

# Code inspection tools
# https://gist.github.com/hassanjamal/c868f8808c06c4acfcf717c0b5bb01e1
brew install php-code-sniffer phpcs

curl -OL https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar
chmod +x drush.phar
sudo mv drush.phar /usr/local/bin/drush
drush self-update

brew cleanup
cd -
