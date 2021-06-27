import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../super_text_style.dart';

class HyperlinkModifier extends SuperTextStyle {
  /// A [SuperTextStyle] that helps in adding tap gestures on
  /// [SText] widget.
  HyperlinkModifier(Map<String, void Function()> routes,
      {Color? color, bool underline = true})
      : super(
          builder: (arg) => TextStyle(
            color: color ?? Colors.blue.shade700,
            decoration:
                underline ? TextDecoration.underline : TextDecoration.none,
          ),
          recognizer: (arg) {
            final callback =
                routes[arg] ?? () => print('$arg route callback not found!');
            return TapGestureRecognizer()..onTap = callback;
          },
        );
}
