#!/bin/bash

brew services stop zentracker
brew cleanup -s zentracker
brew uninstall zentracker
rm /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/zentracker.rb
