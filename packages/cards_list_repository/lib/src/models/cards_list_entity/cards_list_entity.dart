import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'card_data.dart';

class CardsListEntity extends Equatable {
  final List<CardData>? data;

  const CardsListEntity({this.data});

  factory CardsListEntity.fromMap(Map<String, dynamic> data) {
    return CardsListEntity(
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => CardData.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CardsListEntity].
  factory CardsListEntity.fromJson(String data) {
    return CardsListEntity.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CardsListEntity] to a JSON string.
  String toJson() => json.encode(toMap());

  CardsListEntity copyWith({
    List<CardData>? data,
  }) {
    return CardsListEntity(
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [data];
}
