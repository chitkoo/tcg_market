import 'dart:convert';

import 'package:equatable/equatable.dart';

class Resistance extends Equatable {
  final String? type;
  final String? value;

  const Resistance({this.type, this.value});

  factory Resistance.fromMap(Map<String, dynamic> data) => Resistance(
        type: data['type'] as String?,
        value: data['value'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'type': type,
        'value': value,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Resistance].
  factory Resistance.fromJson(String data) {
    return Resistance.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Resistance] to a JSON string.
  String toJson() => json.encode(toMap());

  Resistance copyWith({
    String? type,
    String? value,
  }) {
    return Resistance(
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [type, value];
}
