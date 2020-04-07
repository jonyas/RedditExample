# redditexample

A flutter application which renders a given subreddit

## How to run this example

To run this project, you need to follow this instructions:

*   [Install flutter in your machine](https://flutter.dev/docs/get-started/install).
    *   Please, ensure you also setup an Android or iOS emulator
*   Launch an emulator or plug a development device, Android or iOS.
*   Execute `flutter run` in your terminal in project home folder.
    *   NOTE: If launching in real device, you can execute `flutter run --release` for an optimised build (smoother transitions and animations)
    
## Architecture

This project combines Clean Architecture, being domain layer the core of the app and the only model based layer which does not depend on other layers (only common for simplicity). Here a nice illustration about this architecture pattern:
![Clean architecture diagram](https://koenig-media.raywenderlich.com/uploads/2019/06/Android-Clean-Architecture.png)
[Source](https://www.raywenderlich.com/3595916-clean-architecture-tutorial-for-android-getting-started)

UI and presentation layers are divided using BLoC pattern (The Business Logic Component) which allows to separate presentation layer from business logic.

## Demo

![A small screen captured demo](./screenshots/demo.gif)
