import 'dart:convert';

import 'package:equatable/equatable.dart';

class ReverseHolofoil extends Equatable {
  final double? low;
  final double? mid;
  final double? high;
  final double? market;
  final double? directLow;

  const ReverseHolofoil({
    this.low,
    this.mid,
    this.high,
    this.market,
    this.directLow,
  });

  factory ReverseHolofoil.fromMap(Map<String, dynamic> data) {
    return ReverseHolofoil(
      low: (data['low'] as num?)?.toDouble(),
      mid: (data['mid'] as num?)?.toDouble(),
      high: (data['high'] as num?)?.toDouble(),
      market: (data['market'] as num?)?.toDouble(),
      directLow: (data['directLow'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
        'low': low,
        'mid': mid,
        'high': high,
        'market': market,
        'directLow': directLow,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ReverseHolofoil].
  factory ReverseHolofoil.fromJson(String data) {
    return ReverseHolofoil.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ReverseHolofoil] to a JSON string.
  String toJson() => json.encode(toMap());

  ReverseHolofoil copyWith({
    double? low,
    double? mid,
    double? high,
    double? market,
    double? directLow,
  }) {
    return ReverseHolofoil(
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
