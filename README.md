# Super Text

A powerful yet easy to use plugin to style text effectively
and effeciently in Flutter.

<hr>

<img width="620" src="https://github.com/raj457036/super_text/raw/master/ss1.png" alt="Result">
Read this document to learn more.

<hr>

## Getting Started

`pubspec.yaml`

### Add super text to pubspec.yaml file

```yaml

...
environment:
  sdk: ">=2.12.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter

  super_text:
    git: https://github.com/raj457036/super_text.git 
...

```

## Provide Style Sheet for SText

### SuperTextStyleProvider
it provides style defination to SText widget

#### Example:
```dart
  final styleSheet = {
    "bold": SuperTextStyle(
      builder: (_) => TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    "color": SuperTextStyle(
      builder: (arg) {
        Color color;

        switch (arg) {
          case "red":
            color = Colors.red;
            break;
          default:
            color = Colors.black;
        }
        return TextStyle(
          color: color,
        );
      },
    ),
    /// a built in modifier
    "href": HyperlinkModifier({
      "open_link": (_) => print("Yooo, opening a web page"),
    }),
  }
  Widget build(BuildContext context) {
    return SuperTextStyleProvider(
      data: {
        ...styleSheet,
        "style": MaterialTextThemeModifier(context),
      },
      child: MaterialApp(
        title: 'Super Text Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
```

### Use SText or SelectableSText


```dart
import 'package:flutter/material.dart';
import 'package:super_text/super_text.dart';

class ParagraphWithSuperText extends StatelessWidget {
  const ParagraphWithSuperText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SText("[style:headline3](Super Text)"),
            SizedBox(height: 20.0),
            SelectableSText(
              "[bold](Note): There is a way to download a custom font"
              " along with a webpage, to allow you to customize your "
              "font usage in any way you want: [bold](web fonts). This is a little "
              "bit more complex, and we will discuss it in a [href:open_link, color:black](separate "
              "article) later on in the module.",
            ),
          ],
        ),
      ),
    );
  }
}

```

### Result

<img width="620" src="https://github.com/raj457036/super_text/raw/master/ss1.png" alt="Result">

<hr/>


### Available Modifiers
see example folder to learn how to use inbuilt modifiers


- **MaterialTextThemeModifier** for material text themes style
  ```dart
  SText("[style:headline1](Some Text in H1 style.))
  ```
- **EscapeModifiers** for escaping characters
  ```dart
  SText("[escapes](&ob; What&quote;s up? &cb;)")

  /// results -> "( What's up? )"
  ```
- **HyperlinkModifier** for clickable text
  ```dart
  SText("This one is a [href:open_link, color:red](separate article) to know more.")
  ```

<hr/>

### Thanks