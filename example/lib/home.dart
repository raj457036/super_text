import 'package:flutter/material.dart';
import 'package:super_text/super_text.dart';

import 'widgets/paragraph_with_rich_text.dart';
import 'widgets/paragraph_with_super_text.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 350.0,
            maxHeight: 600,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: ParagraphWithRichText()),
              Flexible(child: ParagraphWithSuperText()),
              SizedBox(height: 20.0),
              Flexible(
                child: SText("The above text is taken from "
                    "[href:open_mozilla](developer.mozilla.org)"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
