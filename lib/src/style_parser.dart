import 'package:equatable/equatable.dart';

import 'style_applier.dart';
import 'style_processor.dart';

final RegExp _exp1 = RegExp(
  r'\[([[\s*?[\w*\,?]+[:\w\,\s?]+?]*)\]\(([\w\s!:\\.{}$&?><,"/+=-_;\*-_+=%$#@!~`^/|]+)\)',
  multiLine: true,
);

final RegExp _exp2 = RegExp(
  r'\[([[\s*?[\w*\,?]+[:\w\,\s?]+?]*)\]\(([\w\s\W\S]+)\)',
  multiLine: true,
);

class StyleParser extends Equatable {
  final _numExp = RegExp(r"\d+");

  final String text;

  final Map<int, StyleApplier> applierMap;

  StyleParser(this.text, {this.applierMap = const {}});

  List<StyleApplier>? parse() {
    Iterable<RegExpMatch> match = _exp1.allMatches(text);

    if (match.isEmpty) {
      match = _exp2.allMatches(text);

      if (match.isEmpty) return null;
    }

    final appliers = <StyleApplier>[];
    for (var m in match) {
      final sample = m.group(2)!;
      final modifiers = m.group(1)!;
      final tokens = StyleProcessor(modifiers).parseTokens();
      final childrens = fetchChildrens(sample);
      final applier = StyleApplier(
        tokens,
        childrens[1],
        m.start,
        m.end,
        childrens: childrens[0],
      );
      appliers.add(applier);
    }

    return appliers;
  }

  List<dynamic> fetchChildrens(String sample) {
    String changed = sample;
    final appliers = <StyleApplier>[];
    final allMatches = _numExp.allMatches(sample);

    for (var match in allMatches) {
      final val = match.group(0);
      if (val == null) continue;
      final style = applierMap[int.parse(val)];
      if (style != null) {
        appliers.add(style);
      }
    }

    for (var applier in appliers) {
      final code = "${applier.hashCode}";
      final sindex = changed.indexOf(code);
      applier.start = sindex;
      applier.end = sindex + code.length;
      changed = changed.replaceRange(applier.start, applier.end, code);
    }

    return [appliers, changed];
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [text];
}

class MultiStyleParser {
  final String text;

  MultiStyleParser(this.text);

  MultiStyleParser clean() {
    var sample = "[null]($text)";
    final _exp = RegExp(r'\)');

    sample = sample.replaceAll(_exp, " )");
    return MultiStyleParser(sample);
  }

  StyleApplier parse() {
    String current = text;

    final _appliersMapper = <int, StyleApplier>{};

    late StyleApplier lastApplier;

    while (true) {
      final appliers = StyleParser(
        current,
        applierMap: _appliersMapper,
      ).parse();

      if (appliers == null) break;

      int diff = 0;
      for (var applier in appliers) {
        final beforeTrim = current.length;
        current = current.replaceRange(
          applier.start + diff,
          applier.end + diff,
          applier.hashCode.toString(),
        );
        final afterTrim = current.length;

        diff += afterTrim - beforeTrim;

        _appliersMapper[applier.hashCode] = applier;
      }

      lastApplier = appliers.first;
    }

    return lastApplier;
  }
}
