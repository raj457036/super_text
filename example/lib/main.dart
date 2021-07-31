import 'package:flutter/material.dart';
import 'package:super_text/super_text.dart';

import 'home.dart';
import 'stylesheet/super_text_style_sheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
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
}
