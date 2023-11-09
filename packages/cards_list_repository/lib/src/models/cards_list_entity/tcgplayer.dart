import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'prices.dart';

class Tcgplayer extends Equatable {
  final String? url;
  final String? updatedAt;
  final Prices? prices;

  const Tcgplayer({this.url, this.updatedAt, this.prices});

  factory Tcgplayer.fromMap(Map<String, dynamic> data) => Tcgplayer(
        url: data['url'] as String?,
        updatedAt: data['updatedAt'] as String?,
        prices: data['prices'] == null
            ? null
            : Prices.fromMap(data['prices'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'updatedAt': updatedAt,
        'prices': prices?.toMap(),
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
    Prices? prices,
  }) {
    return Tcgplayer(
      url: url ?? this.url,
      updatedAt: updatedAt ?? this.updatedAt,
      prices: prices ?? this.prices,
    );
  }

  @override
  List<Object?> get props => [url, updatedAt, prices];
}
