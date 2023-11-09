import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'holofoil.dart';

class Prices extends Equatable {
  final Holofoil? holofoil;

  const Prices({this.holofoil});

  factory Prices.fromMap(Map<String, dynamic> data) => Prices(
        holofoil: data['holofoil'] == null
            ? null
            : Holofoil.fromMap(data['holofoil'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'holofoil': holofoil?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Prices].
  factory Prices.fromJson(String data) {
    return Prices.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Prices] to a JSON string.
  String toJson() => json.encode(toMap());

  Prices copyWith({
    Holofoil? holofoil,
  }) {
    return Prices(
      holofoil: holofoil ?? this.holofoil,
    );
  }

  @override
  List<Object?> get props => [holofoil];
}
