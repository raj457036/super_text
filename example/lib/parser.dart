enum TokenType {
  LEFT_SQ_BKT,
  RIGHT_SQ_BKT,
  LEFT_PAREN,
  RIGHT_PAREN,
  MODIFIER,
  MODIFIER_WITH_ARGS,
  STRING,
  I_STRING,
  EOL,
}

class Token {
  final String lexeme;
  final TokenType type;
  final Object? literal;

  Token({
    required this.lexeme,
    required this.type,
    this.literal,
  });

  @override
  String toString() => 'Token(lexeme: $lexeme, type: $type, litral: $literal)';
}

class Scanner {
  final String source;

  Scanner(this.source);

  final tokens = <Token>[];

  int start = 0;
  int current = 0;

  bool get isAtEnd {
    return current >= source.length;
  }

  String get peek => source[current];
  String get next => (current + 1) < source.length ? source[current + 1] : "";

  List<Token> scanTokens() {
    while (!isAtEnd) {
      // We are at the beginning of the next lexeme.
      start = current;
      scanToken();
    }

    tokens.add(Token(
      type: TokenType.EOL,
      lexeme: "",
    ));
    return tokens;
  }

  void scanToken() {
    String c = advance();
    switch (c) {
      case '(':
        addToken(TokenType.LEFT_PAREN);
        processString();
        break;
      case ')':
        addToken(TokenType.RIGHT_PAREN);
        break;
      case '[':
        addToken(TokenType.LEFT_SQ_BKT);
        processModifiers();
        break;
      case ']':
        addToken(TokenType.RIGHT_SQ_BKT);
        break;
    }
  }

  processModifiers() {
    while (!isAtEnd && next != "]") {
      advance();
    }
  }

  processString() {
    while (!isAtEnd && next != ")") {
      advance();
    }

    if (next == ")") {
      addToken(TokenType.STRING);
    }
  }

  String advance() {
    return source[current++];
  }

  void addToken(TokenType type, [Object? literal]) {
    String text = source.substring(start, current);
    tokens.add(Token(type: type, lexeme: text, literal: literal));
  }
}
