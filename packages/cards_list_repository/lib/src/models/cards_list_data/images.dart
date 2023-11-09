import 'dart:convert';

import 'package:equatable/equatable.dart';

class Images extends Equatable {
  final String? small;
  final String? large;

  const Images({this.small, this.large});

  factory Images.fromMap(Map<String, dynamic> data) => Images(
        small: data['small'] as String?,
        large: data['large'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'small': small,
        'large': large,
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
    String? small,
    String? large,
  }) {
    return Images(
      small: small ?? this.small,
      large: large ?? this.large,
    );
  }

  @override
  List<Object?> get props => [small, large];
}
