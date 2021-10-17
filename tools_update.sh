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
npm update -g
npm install -g npm
export COMPOSER_PROCESS_TIMEOUT=2000
composer selfupdate
# composer selfupdate --2
# composer selfupdate --1
composer clear-cache
composer config -g disable-tls true
composer config -g secure-http false
composer global update
# composer config -g disable-tls false
# composer config -g secure-http true
vagrant box prune --keep-active-boxes
cd -

# Open the tools in case they have been remove from the dock
open -a /Applications/Google\ Chrome.app
open -a /Applications/Firefox.app
open -a /Applications/PhpStorm.app
open -a /Applications/Atom.app/
open -a /Applications/Visual\ Studio\ Code.app
open -a /Applications/Meld.app
open -a /Applications/Sourcetree.app
# open -a /Applications/Utilities/Terminal.app
open -a /Applications/Slack.app
open -a /Applications/zoom.us.app
open -a /Applications/Spotify.app
open -a /Applications/Docker.app
open -a /Applications/Postman.app
open -a /Applications/Virtualbox.app
open -a /Applications/Google\ Drive.app
