# ZenTracker: Time Tracking for Mac
ZenTracker is made to solve a simple problem: understanding how I spend my time on my Mac. It is designed to be dead-simple, completely private, and geek-friendly.

ZenTracker will run in the background, and record the current running application at every minute. You can query your daily activity easily from command line. And you have all the history stored as text files at your disposable. Extract insight from the history as you wish with your commandline-fu.

![example image](https://raw.githubusercontent.com/dohsimpson/ZenTracker/master/example1.png)

## Installation
You need to have [Homebrew](https://brew.sh) installed.

### To Install
```bash
bash install.sh
```

### To Uninstall
```bash
bash uninstall.sh
```

## Usage

Zentracker is collecting activities at the background. See it in action with `ps aux | grep zentrackerd`.

Get the daily summary with command `zentracker`.

## Architecture
ZenTracker consists of 2 components: a tracking daemon that checks the front-most application every minute; and a cli script that generates a summary for the tracked activities of the day.

Since all the tracking data is stored as text files(named in the format `YYYY-MM-DD`) in a directory(default to `~/.zentracker`), it is very easy to write small scripts that parse and generate the reports that you want specifically.

## Contributing
Contributions are very welcome! You can open issues for feature requests, or any great idea for improving ZenTracker! Be sure to open an issue before sending your pull requests.

Setting up your development environment is easy: If you set your environment variable `ZENDIR` to a directory of your preference, executing the tracking daemon `zentrackerd` would write data files to that directory (this way it won't screw up your activity history), and the cli app `zentracker` would also read data from that directory.
