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
      "italic": SuperTextStyle(
        builder: (arg) => TextStyle(
          fontStyle: FontStyle.italic,
        ),
      ),
      "escapes": EscapeModifiers(customEscapes: {
        "smiley": '🙂',
      }),
    };
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iString = "[color: green](SText [bold](Widget))";
    final text =
        "[italic, escapes](This text is &ob; styled by $iString, you can &cb; &smiley;  [underline](underline text), or"
        " [color:red](Change Color of text) or [ escapes, transform:uc, ](just create your"
        " own stylesheet &smiley; ))";

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SText("[bold](Normal Text)"),
              SizedBox(height: 10),
              Text(text),
              SizedBox(height: 10),
              SText("[bold, color: red](SText)"),
              SizedBox(height: 10),
              SText(
                text,
                benchmarkSpeed: true,
                styleSheet: {
                  "transform": SuperTextStyle(
                    transform: (source, arg) {
                      switch (arg) {
                        case "uc":
                          return source.toUpperCase();
                        case "lc":
                          return source.toLowerCase();
                        default:
                          return source;
                      }
                    },
                  ),
                },
                textAlign: TextAlign.center,
              ),
              Divider(),
              SizedBox(height: 10),
              SText("[bold, color: green](SelectableSText)"),
              SizedBox(height: 10),
              SelectableSText(
                text,
                benchmarkSpeed: true,
                styleSheet: {
                  "transform": SuperTextStyle(
                    transform: (source, arg) {
                      switch (arg) {
                        case "uc":
                          return source.toUpperCase();
                        case "lc":
                          return source.toLowerCase();
                        default:
                          return source;
                      }
                    },
                  ),
                },
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
