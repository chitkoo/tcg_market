import 'dart:convert';

import 'package:equatable/equatable.dart';

class Weakness extends Equatable {
  final String? type;
  final String? value;

  const Weakness({this.type, this.value});

  factory Weakness.fromMap(Map<String, dynamic> data) => Weakness(
        type: data['type'] as String?,
        value: data['value'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'type': type,
        'value': value,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Weakness].
  factory Weakness.fromJson(String data) {
    return Weakness.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Weakness] to a JSON string.
  String toJson() => json.encode(toMap());

  Weakness copyWith({
    String? type,
    String? value,
  }) {
    return Weakness(
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [type, value];
}
