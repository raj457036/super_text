import '../super_text_style.dart';

class EscapeModifiers extends SuperTextStyle {
  /// A [SuperTextStyle] that helps in escaping characters in
  /// [SText] widget.
  EscapeModifiers({Map<String, String> customEscapes = const {}})
      : super(
          transform: (source, arg) {
            final replace = {
              "ob": "(",
              "cb": ")",
              "osb": "[",
              "csb": "]",
              ...customEscapes,
            };
            return source.replaceAllMapped(
              RegExp(r"&([\w]+);"),
              (match) {
                final char = match[1];
                return replace[char] ?? match[0]!;
              },
            );
          },
        );
}
