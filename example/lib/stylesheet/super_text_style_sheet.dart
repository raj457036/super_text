import 'package:flutter/material.dart';
import 'package:super_text/super_text.dart';

final styleSheet = {
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
    builder: (arg) => TextStyle(decoration: TextDecoration.underline),
  ),
  "italic": SuperTextStyle(
    builder: (arg) => TextStyle(fontStyle: FontStyle.italic),
  ),
  "escapes": EscapeModifiers(customEscapes: {
    "quote": "'",
  }),
  "href": HyperlinkModifier({
    "open_link": (_) => print("Yooo, opening a web page..."),
    "open_mozilla": (_) => print("go to https://developer.mozilla.org/"),
  }),
};
