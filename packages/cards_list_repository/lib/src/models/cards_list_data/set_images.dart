import 'dart:convert';

import 'package:equatable/equatable.dart';

class SetImages extends Equatable {
  final String? symbol;
  final String? logo;

  const SetImages({this.symbol, this.logo});

  factory SetImages.fromMap(Map<String, dynamic> data) => SetImages(
        symbol: data['symbol'] as String?,
        logo: data['logo'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'symbol': symbol,
        'logo': logo,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SetImages].
  factory SetImages.fromJson(String data) {
    return SetImages.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SetImages] to a JSON string.
  String toJson() => json.encode(toMap());

  SetImages copyWith({
    String? symbol,
    String? logo,
  }) {
    return SetImages(
      symbol: symbol ?? this.symbol,
      logo: logo ?? this.logo,
    );
  }

  @override
  List<Object?> get props => [symbol, logo];
}
