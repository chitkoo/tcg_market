import 'dart:convert';

import 'package:equatable/equatable.dart';

class Holofoil extends Equatable {
  final dynamic low;
  final double? mid;
  final double? high;
  final double? market;
  final double? directLow;

  const Holofoil({
    this.low,
    this.mid,
    this.high,
    this.market,
    this.directLow,
  });

  factory Holofoil.fromMap(Map<String, dynamic> data) => Holofoil(
        low: data['low'] as dynamic,
        mid: (data['mid'] as num?)?.toDouble(),
        high: (data['high'] as num?)?.toDouble(),
        market: (data['market'] as num?)?.toDouble(),
        directLow: (data['directLow'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'low': low,
        'mid': mid,
        'high': high,
        'market': market,
        'directLow': directLow,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Holofoil].
  factory Holofoil.fromJson(String data) {
    return Holofoil.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Holofoil] to a JSON string.
  String toJson() => json.encode(toMap());

  Holofoil copyWith({
    dynamic low,
    double? mid,
    double? high,
    double? market,
    double? directLow,
  }) {
    return Holofoil(
      low: low ?? this.low,
      mid: mid ?? this.mid,
      high: high ?? this.high,
      market: market ?? this.market,
      directLow: directLow ?? this.directLow,
    );
  }

  @override
  List<Object?> get props => [low, mid, high, market, directLow];
}
