
# SeeMovies App

  You're looking at the home of SeeMovies App

## Getting Started

Since the beginning of the project, we're building our app on top of the Flutter framework,
supporting both Android and iOS platform, in the hope for faster development and test cycle

### Setup your development environment

Before you clone this repo, to make sure that you're able to properly add your code and build the
app to test it, make sure you have these installed on your environment:

- Latest Android Studio
- Android Studio-bundled JDK
- Latest [Homebrew](https://brew.sh/) (it makes your life much easier on macOS)
- Flutter >=3.29.3 (obviously) managed by [fvm](https://fvm.app/docs/getting_started/overview)
- Latest [Android Studio](https://developer.android.com/studio)
- Xcode 16.3 managed by [xcodes](https://github.com/XcodesOrg/xcodes)
- Ruby 3.2.2 managed by [rbenv](https://github.com/rbenv/rbenv) _Do NOT use macOS system default

Ruby_
- If you're developing on Apple Silicon-based machines,
install [Rosetta](https://machow2.com/rosetta-mac/). This might be needed under the hood.
- [Fastlane](https://docs.fastlane.tools/) for local CI/CD


## Building and running the app on emulator/simulator  

Just like other Flutter project, you're able to build and run the app using both GUI on Android Studio/VSCode or from the terminal.

You will need this file for can be build and run
1. Create config folder in project level and copy prod-config.json and staging-conf.json
2. If you using VSCode to run then you need to rename launch.json.example to launch.json, if you using AS then you need to create configuration setup. 

## Building and running the app on real devices
For Android, it is pretty straightforward, as you don't have to register your device.
For iOS, you'll need to run the app in Xcode first so that it will register your iOS device to Apple Developer account
