import 'dart:convert';

import 'package:equatable/equatable.dart';

class CardMarketPrices extends Equatable {
  final double? averageSellPrice;
  final double? lowPrice;
  final double? trendPrice;
  final dynamic germanProLow;
  final dynamic suggestedPrice;
  final dynamic reverseHoloSell;
  final double? reverseHoloLow;
  final double? reverseHoloTrend;
  final dynamic lowPriceExPlus;
  final double? avg1;
  final double? avg7;
  final double? avg30;
  final dynamic reverseHoloAvg1;
  final double? reverseHoloAvg7;
  final double? reverseHoloAvg30;

  const CardMarketPrices({
    this.averageSellPrice,
    this.lowPrice,
    this.trendPrice,
    this.germanProLow,
    this.suggestedPrice,
    this.reverseHoloSell,
    this.reverseHoloLow,
    this.reverseHoloTrend,
    this.lowPriceExPlus,
    this.avg1,
    this.avg7,
    this.avg30,
    this.reverseHoloAvg1,
    this.reverseHoloAvg7,
    this.reverseHoloAvg30,
  });

  factory CardMarketPrices.fromMap(Map<String, dynamic> data) =>
      CardMarketPrices(
        averageSellPrice: (data['averageSellPrice'] as num?)?.toDouble(),
        lowPrice: (data['lowPrice'] as num?)?.toDouble(),
        trendPrice: (data['trendPrice'] as num?)?.toDouble(),
        germanProLow: data['germanProLow'] as dynamic,
        suggestedPrice: data['suggestedPrice'] as dynamic,
        reverseHoloSell: data['reverseHoloSell'] as dynamic,
        reverseHoloLow: (data['reverseHoloLow'] as num?)?.toDouble(),
        reverseHoloTrend: (data['reverseHoloTrend'] as num?)?.toDouble(),
        lowPriceExPlus: data['lowPriceExPlus'] as dynamic,
        avg1: (data['avg1'] as num?)?.toDouble(),
        avg7: (data['avg7'] as num?)?.toDouble(),
        avg30: (data['avg30'] as num?)?.toDouble(),
        reverseHoloAvg1: data['reverseHoloAvg1'] as dynamic,
        reverseHoloAvg7: (data['reverseHoloAvg7'] as num?)?.toDouble(),
        reverseHoloAvg30: (data['reverseHoloAvg30'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'averageSellPrice': averageSellPrice,
        'lowPrice': lowPrice,
        'trendPrice': trendPrice,
        'germanProLow': germanProLow,
        'suggestedPrice': suggestedPrice,
        'reverseHoloSell': reverseHoloSell,
        'reverseHoloLow': reverseHoloLow,
        'reverseHoloTrend': reverseHoloTrend,
        'lowPriceExPlus': lowPriceExPlus,
        'avg1': avg1,
        'avg7': avg7,
        'avg30': avg30,
        'reverseHoloAvg1': reverseHoloAvg1,
        'reverseHoloAvg7': reverseHoloAvg7,
        'reverseHoloAvg30': reverseHoloAvg30,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CardMarketPrices].
  factory CardMarketPrices.fromJson(String data) {
    return CardMarketPrices.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CardMarketPrices] to a JSON string.
  String toJson() => json.encode(toMap());

  CardMarketPrices copyWith({
    double? averageSellPrice,
    double? lowPrice,
    double? trendPrice,
    dynamic germanProLow,
    dynamic suggestedPrice,
    dynamic reverseHoloSell,
    double? reverseHoloLow,
    double? reverseHoloTrend,
    dynamic lowPriceExPlus,
    double? avg1,
    double? avg7,
    double? avg30,
    dynamic reverseHoloAvg1,
    double? reverseHoloAvg7,
    double? reverseHoloAvg30,
  }) {
    return CardMarketPrices(
      averageSellPrice: averageSellPrice ?? this.averageSellPrice,
      lowPrice: lowPrice ?? this.lowPrice,
      trendPrice: trendPrice ?? this.trendPrice,
      germanProLow: germanProLow ?? this.germanProLow,
      suggestedPrice: suggestedPrice ?? this.suggestedPrice,
      reverseHoloSell: reverseHoloSell ?? this.reverseHoloSell,
      reverseHoloLow: reverseHoloLow ?? this.reverseHoloLow,
      reverseHoloTrend: reverseHoloTrend ?? this.reverseHoloTrend,
      lowPriceExPlus: lowPriceExPlus ?? this.lowPriceExPlus,
      avg1: avg1 ?? this.avg1,
      avg7: avg7 ?? this.avg7,
      avg30: avg30 ?? this.avg30,
      reverseHoloAvg1: reverseHoloAvg1 ?? this.reverseHoloAvg1,
      reverseHoloAvg7: reverseHoloAvg7 ?? this.reverseHoloAvg7,
      reverseHoloAvg30: reverseHoloAvg30 ?? this.reverseHoloAvg30,
    );
  }

  @override
  List<Object?> get props {
    return [
      averageSellPrice,
      lowPrice,
      trendPrice,
      germanProLow,
      suggestedPrice,
      reverseHoloSell,
      reverseHoloLow,
      reverseHoloTrend,
      lowPriceExPlus,
      avg1,
      avg7,
      avg30,
      reverseHoloAvg1,
      reverseHoloAvg7,
      reverseHoloAvg30,
    ];
  }
}
