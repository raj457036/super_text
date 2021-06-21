import 'package:equatable/equatable.dart';

class StyleToken extends Equatable {
  final String code;
  final String? modifier;

  StyleToken(this.code, {this.modifier});

  @override
  String toString() {
    return "$code : $modifier";
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [code, modifier];
}
