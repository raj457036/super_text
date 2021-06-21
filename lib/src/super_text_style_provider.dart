import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'super_text_style.dart';

class SuperTextStyleProvider extends InheritedWidget {
  /// global stylesheet for [SText] widget
  ///
  /// wrap around [MaterialApp]
  ///
  /// ```dart
  /// @override
  /// Widget build(BuildContext context) {
  ///   return SuperTextStyleProvider(
  ///     data: {
  ///       "bold": SuperTextStyle(
  ///           builder: (_) => TextStyle(fontWeight: FontWeight.bold),
  ///       ),
  ///     },
  ///     child: MaterialApp(...),
  ///   );
  /// }
  ///
  ///     ...
  ///
  /// Container(
  ///   child: SText("[bold](This Text is Bold) This is not."),
  /// )
  ///
  ///
  /// ```
  ///
  ///
  final Map<String, SuperTextStyle> data;

  SuperTextStyleProvider({
    Key? key,
    required this.child,
    this.data = const {},
  }) : super(key: key, child: child);

  final Widget child;

  static SuperTextStyleProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SuperTextStyleProvider>();
  }

  @override
  bool updateShouldNotify(SuperTextStyleProvider oldWidget) {
    return true;
  }
}
