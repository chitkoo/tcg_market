// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'tcg_prices.dart';

class Tcgplayer extends Equatable {
  final String? url;
  final String? updatedAt;
  final TcgPrices? tcgPrices;

  const Tcgplayer({this.url, this.updatedAt, this.tcgPrices});

  factory Tcgplayer.fromMap(Map<String, dynamic> data) => Tcgplayer(
        url: data['url'] as String?,
        updatedAt: data['updatedAt'] as String?,
        tcgPrices: data['prices'] == null
            ? null
            : TcgPrices.fromMap(data['prices'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'updatedAt': updatedAt,
        'prices': tcgPrices?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Tcgplayer].
  factory Tcgplayer.fromJson(String data) {
    return Tcgplayer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Tcgplayer] to a JSON string.
  String toJson() => json.encode(toMap());

  Tcgplayer copyWith({
    String? url,
    String? updatedAt,
    TcgPrices? tcgPrices,
  }) {
    return Tcgplayer(
      url: url ?? this.url,
      updatedAt: updatedAt ?? this.updatedAt,
      tcgPrices: tcgPrices ?? this.tcgPrices,
    );
  }

  @override
  List<Object?> get props => [url, updatedAt, tcgPrices];
}
