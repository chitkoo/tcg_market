import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'card_data.dart';

class CardsListData extends Equatable {
  final List<CardData>? data;
  final int? page;
  final int? pageSize;
  final int? count;
  final int? totalCount;

  const CardsListData({
    this.data,
    this.page,
    this.pageSize,
    this.count,
    this.totalCount,
  });

  factory CardsListData.fromMap(Map<String, dynamic> data) => CardsListData(
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => CardData.fromMap(e as Map<String, dynamic>))
            .toList(),
        page: data['page'] as int?,
        pageSize: data['pageSize'] as int?,
        count: data['count'] as int?,
        totalCount: data['totalCount'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'data': data?.map((e) => e.toMap()).toList(),
        'page': page,
        'pageSize': pageSize,
        'count': count,
        'totalCount': totalCount,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CardsListData].
  factory CardsListData.fromJson(String data) {
    return CardsListData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CardsListData] to a JSON string.
  String toJson() => json.encode(toMap());

  CardsListData copyWith({
    List<CardData>? data,
    int? page,
    int? pageSize,
    int? count,
    int? totalCount,
  }) {
    return CardsListData(
      data: data ?? this.data,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      count: count ?? this.count,
      totalCount: totalCount ?? this.totalCount,
    );
  }

  @override
  List<Object?> get props => [data, page, pageSize, count, totalCount];
}
