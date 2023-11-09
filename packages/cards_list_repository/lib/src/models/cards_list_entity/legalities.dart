import 'dart:convert';

import 'package:equatable/equatable.dart';

class Legalities extends Equatable {
  final String? unlimited;
  final String? expanded;

  const Legalities({this.unlimited, this.expanded});

  factory Legalities.fromMap(Map<String, dynamic> data) => Legalities(
        unlimited: data['unlimited'] as String?,
        expanded: data['expanded'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'unlimited': unlimited,
        'expanded': expanded,
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
    String? expanded,
  }) {
    return Legalities(
      unlimited: unlimited ?? this.unlimited,
      expanded: expanded ?? this.expanded,
    );
  }

  @override
  List<Object?> get props => [unlimited, expanded];
}
