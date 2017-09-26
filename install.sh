#!/bin/bash

cat > /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/zentracker.rb <<EOF
class Zentracker < Formula
  desc "Command Line Automatic Time Tracker for OSX"
  homepage "https://github.com/dohsimpson/ZenTracker"
  url "https://github.com/dohsimpson/ZenTracker/archive/master.zip"
  version "0.0.1"
  sha256 ""

  def install
    bin.install "zentrackerd"
    bin.install "zentracker"
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <true/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>Program</key>
      <string>#{opt_bin}/zentrackerd</string>
      <key>RunAtLoad</key>
      <true/>
    </dict>
    </plist>
    EOS
  end
end
EOF

brew install zentracker
brew services start zentracker
