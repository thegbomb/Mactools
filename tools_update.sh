#!/bin/sh
# ------------------------------------------------------------------
# [gareth alexander] Command line tools updates
#          Update script to keep command line tools updated
# ------------------------------------------------------------------

cd ~
brew update-reset && brew update && brew upgrade
brew outdated
brew list --cask | xargs brew upgrade
npm update -g
npm install -g npm
export COMPOSER_PROCESS_TIMEOUT=2000
composer selfupdate
# composer selfupdate --1
composer clear-cache
composer config -g disable-tls true
composer config -g secure-http false
composer global update
# composer config -g disable-tls false
# composer config -g secure-http true
vagrant box prune --keep-active-boxes
cd -
