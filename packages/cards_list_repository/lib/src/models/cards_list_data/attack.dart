import 'dart:convert';

import 'package:equatable/equatable.dart';

class Attack extends Equatable {
  final String? name;
  final List<dynamic>? cost;
  final dynamic convertedEnergyCost;
  final String? damage;
  final String? text;

  const Attack({
    this.name,
    this.cost,
    this.convertedEnergyCost,
    this.damage,
    this.text,
  });

  factory Attack.fromMap(Map<String, dynamic> data) => Attack(
        name: data['name'] as String?,
        cost: data['cost'] as List<dynamic>?,
        convertedEnergyCost: data['convertedEnergyCost'] as dynamic,
        damage: data['damage'] as String?,
        text: data['text'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'cost': cost,
        'convertedEnergyCost': convertedEnergyCost,
        'damage': damage,
        'text': text,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Attack].
  factory Attack.fromJson(String data) {
    return Attack.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Attack] to a JSON string.
  String toJson() => json.encode(toMap());

  Attack copyWith({
    String? name,
    List<dynamic>? cost,
    dynamic convertedEnergyCost,
    String? damage,
    String? text,
  }) {
    return Attack(
      name: name ?? this.name,
      cost: cost ?? this.cost,
      convertedEnergyCost: convertedEnergyCost ?? this.convertedEnergyCost,
      damage: damage ?? this.damage,
      text: text ?? this.text,
    );
  }

  @override
  List<Object?> get props {
    return [
      name,
      cost,
      convertedEnergyCost,
      damage,
      text,
    ];
  }
}
