#!/bin/sh
# ------------------------------------------------------------------
# [gareth alexander] Command line tools updates
#          Update script to keep command line tools updated
# ------------------------------------------------------------------

brew update-reset && brew update && brew outdated && brew upgrade
# brew cask upgrade
# brew upgrade --cask
npm update -g
npm install -g npm
export COMPOSER_PROCESS_TIMEOUT=2000
composer selfupdate
composer clear-cache
composer config -g disable-tls true
composer config -g secure-http false
composer global update
# composer config -g disable-tls false
# composer config -g secure-http true
vagrant box prune --keep-active-boxes
