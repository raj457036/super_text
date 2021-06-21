import 'super_text_styler.dart';
import 'style_token.dart';
import 'super_text_style.dart';
import 'super_text_style_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StyleApplier {
  final List<StyleToken> styleTokens;
  final String sample;
  int start;
  int end;
  final List<StyleApplier> childrens;

  StyleApplier(
    this.styleTokens,
    this.sample,
    this.start,
    this.end, {
    this.childrens = const [],
  });

  String mapPropsToString(Type runtimeType, List<Object?> props) =>
      '$runtimeType(${props.map((prop) => prop.toString()).join(', ')})';

  @override
  String toString() {
    return mapPropsToString(runtimeType, props);
  }

  List<Object?> get props => [styleTokens, start, end, sample, childrens];

  SuperTextStyler? _mergedStyles(Map<String, SuperTextStyle>? styleSheet) {
    if (styleSheet == null) return null;

    TextStyle _style = TextStyle();

    GestureRecognizer? winnerGesture;
    MouseCursor? winnerCursor;
    String? semmanticLabel;
    List<void Function(PointerEnterEvent)?> allOnEnter = [];
    List<void Function(PointerExitEvent)?> allOnExit = [];

    for (var style in styleTokens) {
      final sts = styleSheet[style.code];
      _style = _style.merge(sts?.builder(style.modifier));
      winnerGesture ??= sts?.recognizer;
      winnerCursor ??= sts?.mouseCursor;

      if (sts?.onEnter != null) {
        allOnEnter.add(sts?.onEnter);
      }
      if (sts?.onExit != null) {
        allOnExit.add(sts?.onExit);
      }

      if (sts?.semanticsLabel != null) {
        semmanticLabel = (semmanticLabel ?? "") + " ${sts!.semanticsLabel}";
      }
    }

    return SuperTextStyler(
      textStyle: _style,
      recognizer: winnerGesture,
      mouseCursor: winnerCursor,
      onEnter: (_) => allOnEnter.forEach((element) => element!(_)),
      onExit: (_) => allOnExit.forEach((element) => element!(_)),
      semanticsLabel: semmanticLabel,
    );
  }

  TextSpan toTextSpans(
    BuildContext context, {
    Map<String, SuperTextStyle> extraStyle = const {},
  }) {
    final styleSheet = <String, SuperTextStyle>{
      ...extraStyle,
      ...?SuperTextStyleProvider.of(context)?.data,
    };

    if (childrens.isEmpty) {
      final style = _mergedStyles(styleSheet);
      return TextSpan(
        text: sample,
        style: style?.textStyle,
        recognizer: style?.recognizer,
        onEnter: style?.onEnter,
        onExit: style?.onExit,
        mouseCursor: style?.mouseCursor,
        semanticsLabel: style?.semanticsLabel,
      );
    }
    final spans = <TextSpan>[];

    var lastCharIndex = 0;
    var index = 0;

    while (index < childrens.length) {
      final style = _mergedStyles(styleSheet);

      final child = childrens[index];

      if (index == 0 && child.start != lastCharIndex) {
        final _text = sample.substring(lastCharIndex, child.start);

        spans.add(
          TextSpan(
            text: _text,
            style: style?.textStyle,
            recognizer: style?.recognizer,
            onEnter: style?.onEnter,
            onExit: style?.onExit,
            mouseCursor: style?.mouseCursor,
            semanticsLabel: style?.semanticsLabel,
          ),
        );
        lastCharIndex = child.start;
        continue;
      }

      if (child.start != lastCharIndex) {
        final _text = sample.substring(lastCharIndex, child.start);

        spans.add(
          TextSpan(
            text: _text,
            style: style?.textStyle,
            recognizer: style?.recognizer,
            onEnter: style?.onEnter,
            onExit: style?.onExit,
            mouseCursor: style?.mouseCursor,
            semanticsLabel: style?.semanticsLabel,
          ),
        );
        lastCharIndex = child.start;
        continue;
      }

      if (child.childrens.isNotEmpty) {
        spans.add(child.toTextSpans(context));
        lastCharIndex = child.end;
        index++;
        continue;
      }

      final cstyle = child._mergedStyles(styleSheet);

      spans.add(
        TextSpan(
          text: child.sample,
          style: cstyle?.textStyle,
          recognizer: cstyle?.recognizer,
          onEnter: cstyle?.onEnter,
          onExit: cstyle?.onExit,
          mouseCursor: cstyle?.mouseCursor,
          semanticsLabel: cstyle?.semanticsLabel,
        ),
      );
      lastCharIndex = child.end;
      index++;
    }

    final style = _mergedStyles(styleSheet);

    if (lastCharIndex != sample.length - 1) {
      final _text = sample.substring(lastCharIndex, sample.length - 1);

      spans.add(
        TextSpan(
          text: _text,
          style: style?.textStyle,
          recognizer: style?.recognizer,
          onEnter: style?.onEnter,
          onExit: style?.onExit,
          mouseCursor: style?.mouseCursor,
          semanticsLabel: style?.semanticsLabel,
        ),
      );
    }

    return TextSpan(
      children: spans,
      style: style?.textStyle,
      recognizer: style?.recognizer,
      onEnter: style?.onEnter,
      onExit: style?.onExit,
      mouseCursor: style?.mouseCursor,
      semanticsLabel: style?.semanticsLabel,
    );
  }
}
