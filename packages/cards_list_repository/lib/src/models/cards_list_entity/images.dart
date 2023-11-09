import 'dart:convert';

import 'package:equatable/equatable.dart';

class Images extends Equatable {
  final String? symbol;
  final String? logo;

  const Images({this.symbol, this.logo});

  factory Images.fromMap(Map<String, dynamic> data) => Images(
        symbol: data['symbol'] as String?,
        logo: data['logo'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'symbol': symbol,
        'logo': logo,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Images].
  factory Images.fromJson(String data) {
    return Images.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Images] to a JSON string.
  String toJson() => json.encode(toMap());

  Images copyWith({
    String? symbol,
    String? logo,
  }) {
    return Images(
      symbol: symbol ?? this.symbol,
      logo: logo ?? this.logo,
    );
  }

  @override
  List<Object?> get props => [symbol, logo];
}
