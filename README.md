# ZenTracker
ZenTracker is a simple command-line based Time Tracker for Mac OS X. It consists of 2 components: an automatic tracking daemon that checks the front-most application every minute; and a _primitive_ cli script that generates a summary for the tracked activities of the day.

Since all the tracking data is stored as text files(named in the format `YYYY-MM-DD`) in a directory(default to `~/.zentracker`), it is very easy to write small scripts that parse and generate the reports that you want specifically.

![example image](https://raw.githubusercontent.com/dohsimpson/ZenTracker/master/example1.png)

## Installation
### Run Daemon in the Foreground
There are nothing to be installed since everything is written in bash. After cloning this repository, run the tracking daemon, execute the `zentrackerd` script, to see activity summary report, execute `zentracker` script, you may need to `chmod +x` those scripts if they are not executable.

### Run Daemon at boot-time
To actually make it useful, you probably want to have the tracking daemon running at computer boot-time. In Mac OS X, start-up programs are managed by apple's __launchctl__, which requires start-up programs to have a _plist_ file installed by launchctl.

There is a simpler way(simpler in term of installing, upgrading and uninstalling), [Homebrew](https://github.com/Homebrew/brew) offers a way to manage the installation of _plist_ files to launchctl, and therefore it is the recommended way to install ZenTracker. The procedure follows:

I am still waiting for Homebrew to approve the formula. Before that, you will have to do it the complex way:

1. Create a brew formula:
    ```bash
    brew create zentracker https://github.com/dohsimpson/ZenTracker/archive/master.zip
    ```
    Use the default formula name: zentracker.

2. Edit the formula by copy pasting the following code to the formula file:
    ```ruby
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

      test do
        system "zentracker"
      end
    end
    ```

3. Install the formula
    ```bash
    brew install zentracker
    ```

4. Add ZenTracker to startup item using `brew service` command
    ```bash
    brew services start zentracker
    ```

5. Uninstall
    ```bash
    brew services stop zentracker
    brew uninstall zentracker
# if you want to remove formula completely from brew
    cd  /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/
    rm zentracker.rb
    ```

## Usage
As the daemon is started and running in the background. You can run `zentracker` in command line to view a summary of your activities of the day. Enjoy!

## Contributing
Contributions are very welcome! You can open issues for feature requests, or any great idea for improving ZenTracker! Be sure to open an issue before sending your pull requests.

Setting up your development environment is easy: If you set your environment variable `ZENDIR` to a directory of your preference, executing the tracking daemon `zentrackerd` would write data files to that directory, and the cli app `zentracker` would also read data from that directory.
