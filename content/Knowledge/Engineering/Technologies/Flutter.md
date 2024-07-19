---
title: Flutter
description: Flutter
---

Flutter is a framework for building frontends that work natively on Android, iOS, Windows, macOS, Linux and web browsers, all from a single codebase. Although you can target many different platforms, it's hard to build a unified experience on all of them and the codebase will become more complex, so it's common for people to exclusively use Flutter for mobile development and then build out a web frontend separately, for example.

Flutter ships with a comprehensive widget library and Google maintains many of its plugins.
<mark style="background: #ADCCFFA6;"></mark> 
Flutter has its own rendering engine built with C++ and [Skia](https://skia.org/) which is credited with being highly performant (substantially better rendering performance than [React Native](https://reactnative.dev/)). This means your Dart code renders custom UI elements to the screen, not native elements like React Native would.



## Core
Flutter's UI component hierarchy is similar to [[Knowledge/Engineering/Technologies/React|React's]]. In Flutter, we call UI components *widgets*. Every widget has a `build` method that declares how the widget is displayed and what it's composed of (this is similar to the `render` method in React components).

**TODO**:
- `Colors` class
- `Icon` class
- `BuildContext`. Every widget's `build` method takes in a BuildContext. Things like `Navigator`, `MediaQuery`, `ListView.builder` all need it.
- `ThemeData`

### Stateful Widgets
Stateless widgets are immutable.
Stateful widgets maintain state over time and is create through extending `StatefulWidget` which creates an instance of `State`.
```dart
class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return ...;
  }
}
```

**TODO**:
- `setState`

### Routing

**TODO**:
- `Navigator` contains a stack of routes. Pushing to this stack changes the route. Popping navigates back.

### Theming


## Widgets Reference

`ListView`
`Scaffold`
`AppBar`
`IconButton`



## Flutter Architecture
TODO. https://www.google.com/search?q=flutter+architecture&oq=flutter+architecture&aqs=chrome..69i57.1890j0j9&sourceid=chrome&ie=UTF-8

## Flutter CLI
```bash
flutter doctor    # Sanity checks the Flutter installation.
flutter devices   # List all connected devices.

flutter clean
flutter run

flutter pub add <package_name>

```

## Flare
TODO: https://www.youtube.com/watch?v=hwBUU9CP4qI&ab_channel=Fireship
