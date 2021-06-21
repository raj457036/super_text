import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class SuperTextStyle {
  final TextStyle Function(String? arg) builder;
  final GestureRecognizer? recognizer;
  final MouseCursor? mouseCursor;
  final void Function(PointerEnterEvent)? onEnter;
  final void Function(PointerExitEvent)? onExit;
  final String? semanticsLabel;

  SuperTextStyle({
    required this.builder,
    this.recognizer,
    this.mouseCursor,
    this.onEnter,
    this.onExit,
    this.semanticsLabel,
  });
}
