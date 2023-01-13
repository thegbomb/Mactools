#!/bin/sh
# ------------------------------------------------------------------
# [gareth alexander] Command line tools updates
#          Update script to keep command line tools updated
# ------------------------------------------------------------------

cd ~
git -C /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask fetch --unshallow
brew update-reset && brew update && brew upgrade
brew outdated
brew upgrade --cask
brew list --cask | xargs brew upgrade --cask

# Check then relink php
php -v
brew unlink php && brew link --overwrite --force php@7.4
php -v
brew unlink php && brew link --overwrite --force php@8.1
php -v
brew unlink php && brew link --overwrite --force php@8.0
php -v
brew services restart php
npm update -g
npm install -g npm

export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;

nvm install 12
nvm use 12
node -v
nvm install 18
nvm use 18
node -v
nvm install 16
nvm use 16
node -v

ulimit -n 10000
export COMPOSER_PROCESS_TIMEOUT=2000
export COMPOSER_MEMORY_LIMIT=-1
composer selfupdate
# composer selfupdate --2
# composer selfupdate --1
composer clear-cache
# composer config -g disable-tls true
# composer config -g secure-http false
composer global update
# composer config -g disable-tls false
# composer config -g secure-http true
# vagrant box prune --keep-active-boxes
drush self-update
cd -

# Open the tools in case they have been remove from the dock
open -a /Applications/Google\ Chrome.app
open -a /Applications/Firefox.app
open -a /Applications/Microsoft\ Edge.app
open -a /Applications/PhpStorm.app
open -a /Applications/Atom.app/
# open -a /Applications/Visual\ Studio\ Code.app
open -a /Applications/Meld.app
open -a /Applications/Sourcetree.app
# open -a /Applications/Utilities/Terminal.app
open -a /Applications/Slack.app
open -a /Applications/zoom.us.app
open -a /Applications/Spotify.app
open -a /Applications/Docker.app
open -a /Applications/Postman.app
open -a /Applications/Sequel\ Ace.app
# open -a /Applications/TablePlus.app
# open -a /Applications/Virtualbox.app
open -a /Applications/Dropbox.app
open -a /Applications/Google\ Drive.app
open -a /Applications/Microsoft\ Outlook.app
open -a /Applications/Microsoft\ Teams.app
open -a /Applications/Microsoft\ Word.app
open -a /Applications/Microsoft\ Excel.app
open -a /Applications/Grammarly\ Editor.app
# open -a /Applications/Clickup.app
open -a /Applications/Screaming\ Frog\ SEO\ Spider.app
