import 'dart:convert';

import 'package:cards_list_repository/src/models/cards_list_data/card_market_prices.dart';
import 'package:equatable/equatable.dart';

class Cardmarket extends Equatable {
  final String? url;
  final String? updatedAt;
  final CardMarketPrices? prices;

  const Cardmarket({this.url, this.updatedAt, this.prices});

  factory Cardmarket.fromMap(Map<String, dynamic> data) => Cardmarket(
        url: data['url'] as String?,
        updatedAt: data['updatedAt'] as String?,
        prices: data['prices'] == null
            ? null
            : CardMarketPrices.fromMap(data['prices'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'updatedAt': updatedAt,
        'prices': prices?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Cardmarket].
  factory Cardmarket.fromJson(String data) {
    return Cardmarket.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Cardmarket] to a JSON string.
  String toJson() => json.encode(toMap());

  Cardmarket copyWith({
    String? url,
    String? updatedAt,
    CardMarketPrices? prices,
  }) {
    return Cardmarket(
      url: url ?? this.url,
      updatedAt: updatedAt ?? this.updatedAt,
      prices: prices ?? this.prices,
    );
  }

  @override
  List<Object?> get props => [url, updatedAt, prices];
}
