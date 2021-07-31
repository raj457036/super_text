import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../super_text_style.dart';

typedef void TapAction(String? arg);

class HyperlinkModifier extends SuperTextStyle {
  /// A [SuperTextStyle] that helps in adding tap gestures on
  /// [SText] widget.
  ///
  /// `onTap` : `arg` provided to this modifier will be passed
  /// to this callback
  HyperlinkModifier(
    Map<String, TapAction> routes, {
    Color? color,
    bool underline = true,
    TapAction? onTap,
  }) : super(
          builder: (arg) => TextStyle(
            color: color ?? Colors.blue.shade700,
            decoration:
                underline ? TextDecoration.underline : TextDecoration.none,
          ),
          recognizer: (arg) {
            final callback = routes[arg] ??
                onTap ??
                (_) => print('$_ route callback not found!');
            return TapGestureRecognizer()..onTap = () => callback(arg);
          },
        );
}
