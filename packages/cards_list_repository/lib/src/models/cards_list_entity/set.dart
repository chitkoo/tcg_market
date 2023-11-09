import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'images.dart';
import 'legalities.dart';

class Set extends Equatable {
  final String? id;
  final String? name;
  final String? series;
  final dynamic printedTotal;
  final dynamic total;
  final Legalities? legalities;
  final String? ptcgoCode;
  final String? releaseDate;
  final String? updatedAt;
  final Images? images;

  const Set({
    this.id,
    this.name,
    this.series,
    this.printedTotal,
    this.total,
    this.legalities,
    this.ptcgoCode,
    this.releaseDate,
    this.updatedAt,
    this.images,
  });

  factory Set.fromMap(Map<String, dynamic> data) => Set(
        id: data['id'] as String?,
        name: data['name'] as String?,
        series: data['series'] as String?,
        printedTotal: data['printedTotal'] as dynamic,
        total: data['total'] as dynamic,
        legalities: data['legalities'] == null
            ? null
            : Legalities.fromMap(data['legalities'] as Map<String, dynamic>),
        ptcgoCode: data['ptcgoCode'] as String?,
        releaseDate: data['releaseDate'] as String?,
        updatedAt: data['updatedAt'] as String?,
        images: data['images'] == null
            ? null
            : Images.fromMap(data['images'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'series': series,
        'printedTotal': printedTotal,
        'total': total,
        'legalities': legalities?.toMap(),
        'ptcgoCode': ptcgoCode,
        'releaseDate': releaseDate,
        'updatedAt': updatedAt,
        'images': images?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Set].
  factory Set.fromJson(String data) {
    return Set.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Set] to a JSON string.
  String toJson() => json.encode(toMap());

  Set copyWith({
    String? id,
    String? name,
    String? series,
    dynamic printedTotal,
    dynamic total,
    Legalities? legalities,
    String? ptcgoCode,
    String? releaseDate,
    String? updatedAt,
    Images? images,
  }) {
    return Set(
      id: id ?? this.id,
      name: name ?? this.name,
      series: series ?? this.series,
      printedTotal: printedTotal ?? this.printedTotal,
      total: total ?? this.total,
      legalities: legalities ?? this.legalities,
      ptcgoCode: ptcgoCode ?? this.ptcgoCode,
      releaseDate: releaseDate ?? this.releaseDate,
      updatedAt: updatedAt ?? this.updatedAt,
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      series,
      printedTotal,
      total,
      legalities,
      ptcgoCode,
      releaseDate,
      updatedAt,
      images,
    ];
  }
}
