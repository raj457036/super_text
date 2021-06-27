import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class SuperTextStyle {
  /// build text style based on optional arguments
  ///
  /// structure, `[modifier1: arg, modifier2,](string)`
  ///
  /// example: `hello [color: red]( world )`
  final TextStyle Function(String? arg)? builder;

  /// add gesture recognizer for this modifier
  ///
  /// Note: if multiple gesture recognizer overlap on a single
  /// modifier the nearest recognizer will be choosen.
  final GestureRecognizer Function(String? arg)? recognizer;

  /// mouse cursor for this modifier
  final MouseCursor? mouseCursor;

  /// callback to be called when this modifier is entered by a pointer.
  ///
  /// Note: if multiple callbacks are overlapping on single modifier
  /// all `onEnter` events will be called from top-most element to bottom-most.
  final void Function(PointerEnterEvent)? onEnter;

  /// callback to be called when this modifier is exited by a pointer.
  ///
  /// Note: if multiple callbacks are overlapping on single modifier
  /// all `onExit` events will be called from bottom-most element to top-most.
  final void Function(PointerExitEvent)? onExit;

  /// semantics label for this modifier
  final String? semanticsLabel;

  /// Transform source string to transformed string
  ///
  /// Reduces source to a single string by iteratively transforming
  /// source using the provided transform function.
  ///
  /// NOTE: TRANSFORMER MODIFIERS ARE EXECUTED LEFT TO RIGHT.
  ///
  /// example: "`[t1, t2, t3, t4](hello world)`"
  ///
  /// In above example, string `hello world` is first transformed by
  /// `t1` then the result will be transformed by `t2` till `t4`;
  ///
  ///
  final String Function(String source, String? arg)? transform;

  SuperTextStyle({
    this.builder,
    this.recognizer,
    this.mouseCursor,
    this.onEnter,
    this.onExit,
    this.semanticsLabel,
    this.transform,
  });
}
