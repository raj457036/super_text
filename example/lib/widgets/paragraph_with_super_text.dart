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
              benchmarkSpeed: true,
            ),
          ],
        ),
      ),
    );
  }
}
