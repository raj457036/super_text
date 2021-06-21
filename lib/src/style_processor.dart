import 'package:equatable/equatable.dart';
import 'style_token.dart';

class StyleProcessor extends Equatable {
  final String modifiers;

  StyleProcessor(this.modifiers);

  List<StyleToken> parseTokens() {
    final _tokens = modifiers.split(",").map((e) => e.trim());
    final tokens = <StyleToken>[];

    for (var t in _tokens) {
      final _multiValueChecked = splitMultiValue(t).toList();

      late StyleToken token;

      if (_multiValueChecked.length > 1) {
        token = StyleToken(_multiValueChecked.first,
            modifier: _multiValueChecked.last);
      } else {
        token = StyleToken(_multiValueChecked.first);
      }

      tokens.add(token);
    }

    return tokens;
  }

  Iterable<String> splitMultiValue(String sample) {
    return sample.split(":").map((e) => e.trim());
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [modifiers];
}
