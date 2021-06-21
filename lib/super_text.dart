library super_text;

import 'src/style_parser.dart';
import 'src/super_text_style.dart';
import 'package:flutter/material.dart';
export 'src/super_text_style_provider.dart';
export 'src/super_text_style.dart';

class SText extends StatelessWidget {
  /// enable text selection
  final bool selectable;

  /// The text to display.
  final String text;

  /// inline stylesheet
  ///
  /// use global sheet for effecient code by wrapping
  /// material app with [SuperTextStyleProvider]
  final Map<String, SuperTextStyle> styleSheet;

  const SText(
    this.text, {
    Key? key,
    this.selectable = false,
    this.styleSheet = const {},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final applier = MultiStyleParser(text).clean().parse();
    final spans = applier.toTextSpans(
      context,
      extraStyle: styleSheet,
    );
    if (selectable) return SelectableText.rich(spans);
    return Text.rich(spans);
  }
}
