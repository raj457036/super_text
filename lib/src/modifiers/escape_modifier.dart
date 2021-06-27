import '../../super_text.dart';

/// A [SuperTextStyle] that helps in escaping characters in
/// [SText] widget.
class EscapeModifiers extends SuperTextStyle {
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
