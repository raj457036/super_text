import 'package:flutter/material.dart';

import '../super_text_style.dart';

class MaterialTextThemeModifier extends SuperTextStyle {
  /// A [SuperTextStyle] that adds material text theme support to
  /// [SText] widget.
  MaterialTextThemeModifier(BuildContext context)
      : super(
          builder: (_) {
            final _default = TextStyle();
            final textTheme = Theme.of(context).textTheme;

            switch (_) {
              case "headline1":
                return textTheme.headline1 ?? _default;
              case "headline2":
                return textTheme.headline2 ?? _default;
              case "headline3":
                return textTheme.headline3 ?? _default;
              case "headline4":
                return textTheme.headline4 ?? _default;
              case "headline5":
                return textTheme.headline5 ?? _default;
              case "headline6":
                return textTheme.headline6 ?? _default;
              case "body1":
                return textTheme.bodyText1 ?? _default;
              case "body2":
                return textTheme.bodyText2 ?? _default;
              case "caption":
                return textTheme.caption ?? _default;
              case "subtitle1":
                return textTheme.subtitle1 ?? _default;
              case "subtitle2":
                return textTheme.subtitle2 ?? _default;
              case "overline":
                return textTheme.overline ?? _default;
              default:
                return _default;
            }
          },
        );
}
