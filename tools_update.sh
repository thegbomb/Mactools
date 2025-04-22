#!/bin/sh
# ------------------------------------------------------------------
# [gareth alexander] Command line tools updates
#          Update script to keep command line tools updated
# ------------------------------------------------------------------

cd ~
cd $(brew --repo); git fetch; git reset --hard origin/master;
# git -C /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask fetch --unshallow
brew update-reset && brew update && brew upgrade
brew outdated
brew upgrade --cask
brew list --cask | xargs brew upgrade --cask
cd ~

echo "Currently installed:"
brew info --cask --json=v2 $(brew list --cask) | jq -r '.[] | .[] | "\(.token): \(.version)"'

# Check then relink php
php -v
brew unlink php && brew link --overwrite --force php@8.3
#php -v
# brew unlink php && brew link --overwrite --force php@7.4
# php -v
# brew unlink php && brew link --overwrite --force php@8.2
#php -v
#brew unlink php && brew link --overwrite --force php@8.1
php -v
brew services restart php

# Remving these as hopefully they can be managed in a container
# npm update -g
# npm install -g npm

# export NVM_DIR=$HOME/.nvm;
# source $NVM_DIR/nvm.sh;

# nvm install 12
# nvm use 12
# node -v
# nvm install 18
# nvm use 18
# node -v
# nvm install 16
# nvm use 16
# node -v

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
# drush self-update
# blt self-update
acli self-update --stable

cd -

# Open the tools in case they have been remove from the dock
open -a /Applications/Google\ Chrome.app
open -a /Applications/Firefox.app
open -a /Applications/Microsoft\ Edge.app
open -a /Applications/PhpStorm.app
open -a /Applications/Pulsar.app/
# open -a /Applications/Atom.app/
# open -a /Applications/Visual\ Studio\ Code.app
# open -a /Applications/Meld.app
# open -a /Applications/Sourcetree.app
# open -a /Applications/Utilities/Terminal.app
open -a /Applications/1Password.app
open -a /Applications/Slack.app
open -a /Applications/zoom.us.app
open -a /Applications/Spotify.app
open -a /Applications/Docker.app
# open -a /Applications/Postman.app
# open -a /Applications/Sequel\ Ace.app
# open -a /Applications/TablePlus.app
# open -a /Applications/Virtualbox.app
open -a /Applications/Dropbox.app
open -a /Applications/Google\ Drive.app
# open -a /Applications/Microsoft\ Word.app
# open -a /Applications/Microsoft\ Excel.app
open -a /Applications/Grammarly\ Desktop.app
# open -a /Applications/Clickup.app
open -a /Applications/Screaming\ Frog\ SEO\ Spider.app
open -a /Applications/Stats.app

# Do this is there are issues with DDEV after updates.
#sudo /Applications/Docker.app/Contents/MacOS/install remove-vmnetd
#sudo /Applications/Docker.app/Contents/MacOS/install vmnetd

#docker rm $(docker ps -qf 'status=exited')
#docker rmi $(docker images -qf 'dangling=true')
#docker rmi $(docker images | awk '/^<none>/ {print $3}')
#docker volume rm $(docker volume ls -qf 'dangling=true')
