import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ParagraphWithRichText extends StatelessWidget {
  const ParagraphWithRichText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exampleText = [
      "Note",
      ": There is a way to download a custom font along with a webpage, to"
          " allow you to customize your font usage in any way you want: ",
      "web fonts. ",
      "This is a little bit more complex, and we will discuss it in a ",
      "separate article",
      " later on in the module."
    ];

    final boldStyle = TextStyle(
      fontWeight: FontWeight.bold,
    );
    final underlineStyle = TextStyle(
      decoration: TextDecoration.underline,
    );
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Rich Text", style: textTheme.headline3),
            SizedBox(height: 20.0),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: exampleText[0],
                  style: boldStyle,
                ),
                TextSpan(text: exampleText[1]),
                TextSpan(text: exampleText[2], style: boldStyle),
                TextSpan(text: exampleText[3]),
                TextSpan(
                  text: exampleText[4],
                  style: underlineStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => print("Yooo, opening a web page..."),
                ),
                TextSpan(text: exampleText[5]),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
