import 'dart:convert';

import 'package:equatable/equatable.dart';

class Legalities extends Equatable {
  final String? unlimited;

  const Legalities({this.unlimited});

  factory Legalities.fromMap(Map<String, dynamic> data) => Legalities(
        unlimited: data['unlimited'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'unlimited': unlimited,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Legalities].
  factory Legalities.fromJson(String data) {
    return Legalities.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Legalities] to a JSON string.
  String toJson() => json.encode(toMap());

  Legalities copyWith({
    String? unlimited,
  }) {
    return Legalities(
      unlimited: unlimited ?? this.unlimited,
    );
  }

  @override
  List<Object?> get props => [unlimited];
}
