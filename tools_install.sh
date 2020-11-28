#!/bin/sh
# ------------------------------------------------------------------
# [gareth alexander] Command line tools updates
#          Script to install command line tools
# ------------------------------------------------------------------

sudo xcodebuild -license
xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible composer drush git npm nvm php@7.3
brew tap caskroom/cask
brew cask install chromedriver firefox meld netbeans phpstorm sourcetree virtualbox vagrant

curl -OL https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar
chmod +x drush.phar
sudo mv drush.phar /usr/local/bin/drush
drush self-update
