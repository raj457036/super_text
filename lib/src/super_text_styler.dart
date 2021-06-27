import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class SuperTextStyler {
  final TextStyle? textStyle;
  final GestureRecognizer? recognizer;
  final MouseCursor? mouseCursor;
  final void Function(PointerEnterEvent)? onEnter;
  final void Function(PointerExitEvent)? onExit;
  final String? semanticsLabel;
  final String Function(String source)? transform;

  SuperTextStyler({
    this.textStyle,
    this.recognizer,
    this.mouseCursor,
    this.onEnter,
    this.onExit,
    this.semanticsLabel,
    this.transform,
  });
}
