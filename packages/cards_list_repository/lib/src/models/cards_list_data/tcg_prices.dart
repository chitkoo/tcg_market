import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'holofoil.dart';
import 'reverse_holofoil.dart';

class TcgPrices extends Equatable {
  final Holofoil? holofoil;
  final ReverseHolofoil? reverseHolofoil;

  const TcgPrices({this.holofoil, this.reverseHolofoil});

  factory TcgPrices.fromMap(Map<String, dynamic> data) => TcgPrices(
        holofoil: data['holofoil'] == null
            ? null
            : Holofoil.fromMap(data['holofoil'] as Map<String, dynamic>),
        reverseHolofoil: data['reverseHolofoil'] == null
            ? null
            : ReverseHolofoil.fromMap(
                data['reverseHolofoil'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'holofoil': holofoil?.toMap(),
        'reverseHolofoil': reverseHolofoil?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TcgPrices].
  factory TcgPrices.fromJson(String data) {
    return TcgPrices.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TcgPrices] to a JSON string.
  String toJson() => json.encode(toMap());

  TcgPrices copyWith({
    Holofoil? holofoil,
    ReverseHolofoil? reverseHolofoil,
  }) {
    return TcgPrices(
      holofoil: holofoil ?? this.holofoil,
      reverseHolofoil: reverseHolofoil ?? this.reverseHolofoil,
    );
  }

  @override
  List<Object?> get props => [holofoil, reverseHolofoil];
}
