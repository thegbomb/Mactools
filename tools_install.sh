#!/bin/sh
# ------------------------------------------------------------------
# [gareth alexander] Command line tools updates
#          Script to install command line tools
# ------------------------------------------------------------------

sudo xcodebuild -license
xcode-select --install

mkdir ~/.ssh && touch ~/.ssh/config
ssh-keygen -t rsa -b 4096 -C "email@here.com"
ssh-add -K ~/.ssh/id_rsa
nano ~/.ssh/config

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/cask

brew update
brew doctor

brew install wget curl
brew install php@7.3 git composer
brew install mysql sqlite
brew install ansible npm nvm

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
brew install --cask lastpass

# Dev IDE
brew install java
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
brew install --cask atom netbeans phpstorm

# Productivity
brew install --cask meld sourcetree
brew install --cask virtualbox vagrant
brew install --cask dropbox

# Collaboration tools
brew install --cask slack
brew install --cask zoom
brew install --cask microsoft-teams

# Notes tools
brew install --cask evernote skitch

# Others
brew install --cask imageoptim
brew install --cask spotify

curl -OL https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar
chmod +x drush.phar
sudo mv drush.phar /usr/local/bin/drush
drush self-update

brew cleanup
