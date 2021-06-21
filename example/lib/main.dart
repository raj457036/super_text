import 'package:flutter/material.dart';
import 'package:super_text/super_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SuperTextStyleProvider(
      data: getStyleSheet(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }

  Map<String, SuperTextStyle> getStyleSheet() {
    return {
      "bold": SuperTextStyle(
        builder: (_) => TextStyle(fontWeight: FontWeight.bold),
      ),
      "color": SuperTextStyle(
        builder: (arg) {
          Color color;

          switch (arg) {
            case "blue":
              color = Colors.blue;
              break;
            case "red":
              color = Colors.red;
              break;
            case "green":
              color = Colors.green;
              break;
            default:
              color = Colors.black;
          }
          return TextStyle(
            color: color,
          );
        },
      ),
      "underline": SuperTextStyle(
        builder: (arg) => TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    };
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text =
        "[ws:20, color:green, underline](This text is [bold](World) styled "
        "[color:red](by using [bold,color:blue](SText [color:green](Widget.)) "
        "Its Easy) you can [color:bold](try) this example.";
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            SText(
              text,
              selectable: true,
              styleSheet: {
                "ws": SuperTextStyle(
                  builder: (arg) => TextStyle(
                    // fontWeight: FontWeight.w100,
                    wordSpacing: double.parse(arg ?? "1"),
                    color: Colors.lightBlue,
                  ),
                )
              },
            ),
          ],
        ),
      ),
    );
  }
}
