# Custom navigator

A flutter package that handles navigation deep in the widget tree


![](giphy.gif)

## Getting Started

The [CustomNavigator] is fairly easy to use

After adding the project to your `pubspec.yaml` file, use it as follows:

```dart

CustomNavigator(
        home: yourChildWidget(),
        //Specify your page route [PageRoutes.materialPageRoute] or [PageRoutes.cupertinoPageRoute]
        pageRoute: PageRoutes.materialPageRoute,
      );
```
Then you can call it using the same old `Navigator.of(context)`
### Options
* you can specify Named routes exactly like in MaterialApp.

if you want to use the default [Navigator] you need to specify a
[GlobalKey] to your [MaterialApp] and use it `navigatorKey.currentState`

See the example for more details.