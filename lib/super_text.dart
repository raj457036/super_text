library super_text;

import 'dart:developer';

import 'package:flutter/gestures.dart';

import 'src/style_parser.dart';
import 'src/super_text_style.dart';
import 'package:flutter/material.dart';
export 'src/super_text_style_provider.dart';
export 'src/super_text_style.dart';
export 'src/modifiers/escape_modifier.dart';
export 'src/modifiers/hyperlink_modifier.dart';
export 'src/modifiers/material_text_theme_modifier.dart';

class SText extends StatelessWidget {
  /// The text to display.
  final String text;

  /// debug to check the time it took to process the string
  final bool benchmarkSpeed;

  /// inline stylesheet
  ///
  /// use global sheet for effecient code by wrapping
  /// material app with [SuperTextStyleProvider]
  final Map<String, SuperTextStyle> styleSheet;

  final Locale? locale;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;

  ///Creates a text widget with a [SText].
  ///
  const SText(
    this.text, {
    Key? key,
    this.styleSheet = const {},
    this.benchmarkSpeed = false,
    this.locale,
    this.maxLines,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.style,
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? start;

    if (benchmarkSpeed) start = DateTime.now().millisecondsSinceEpoch;
    final applier = MultiStyleParser(text).clean().parse();
    final spans = applier.toTextSpans(
      context,
      extraStyle: styleSheet,
    );
    if (benchmarkSpeed) {
      final end = DateTime.now().millisecondsSinceEpoch;
      log("SText Took ${end - start!} milliSec to process.");
    }

    return Text.rich(
      spans,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }
}

class SelectableSText extends StatelessWidget {
  /// The text to display.
  final String text;

  /// debug to check the time it took to process the string
  final bool benchmarkSpeed;

  /// inline stylesheet
  ///
  /// use global sheet for effecient code by wrapping
  /// material app with [SuperTextStyleProvider]
  final Map<String, SuperTextStyle> styleSheet;

  final Locale? locale;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;

  final bool autofocus;
  final Color? cursorColor;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final double cursorWidth;
  final DragStartBehavior dragStartBehavior;
  final bool enableInteractiveSelection;
  final FocusNode? focusNode;
  final int? minLines;
  final void Function(TextSelection, SelectionChangedCause?)?
      onSelectionChanged;
  final VoidCallback? onTap;
  final ScrollPhysics? scrollPhysics;
  final TextSelectionControls? selectionControls;
  final bool showCursor;
  final ToolbarOptions? toolbarOptions;

  ///Creates a selectable text widget with a [SText].
  ///
  ///The [autofocus] and [dragStartBehavior] arguments must not be null.
  const SelectableSText(
    this.text, {
    Key? key,
    this.styleSheet = const {},
    this.benchmarkSpeed = false,
    this.locale,
    this.maxLines,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.style,
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
    this.autofocus = false,
    this.cursorColor,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorWidth = 2.0,
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.focusNode,
    this.minLines,
    this.onSelectionChanged,
    this.onTap,
    this.scrollPhysics,
    this.selectionControls,
    this.showCursor = false,
    this.toolbarOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? start;

    if (benchmarkSpeed) start = DateTime.now().millisecondsSinceEpoch;
    final applier = MultiStyleParser(text).clean().parse();
    final spans = applier.toTextSpans(
      context,
      extraStyle: styleSheet,
    );
    if (benchmarkSpeed) {
      final end = DateTime.now().millisecondsSinceEpoch;
      log("Selectable SText Took ${end - start!} milliSec to process.");
    }
    return SelectableText.rich(
      spans,
      maxLines: maxLines,
      strutStyle: strutStyle,
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
      autofocus: autofocus,
      cursorColor: cursorColor,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      cursorWidth: cursorWidth,
      dragStartBehavior: dragStartBehavior,
      enableInteractiveSelection: enableInteractiveSelection,
      focusNode: focusNode,
      minLines: minLines,
      onSelectionChanged: onSelectionChanged,
      onTap: onTap,
      scrollPhysics: scrollPhysics,
      selectionControls: selectionControls,
      showCursor: showCursor,
      toolbarOptions: toolbarOptions,
    );
  }
}
