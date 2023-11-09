// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'legalities.dart';
import 'set_images.dart';

class SetData extends Equatable {
  final String? id;
  final String? name;
  final String? series;
  final dynamic printedTotal;
  final dynamic total;
  final Legalities? legalities;
  final String? ptcgoCode;
  final String? releaseDate;
  final String? updatedAt;
  final SetImages? setImages;

  const SetData({
    this.id,
    this.name,
    this.series,
    this.printedTotal,
    this.total,
    this.legalities,
    this.ptcgoCode,
    this.releaseDate,
    this.updatedAt,
    this.setImages,
  });

  factory SetData.fromMap(Map<String, dynamic> data) => SetData(
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
        setImages: data['images'] == null
            ? null
            : SetImages.fromMap(data['images'] as Map<String, dynamic>),
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
        'images': setImages?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SetData].
  factory SetData.fromJson(String data) {
    return SetData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SetData] to a JSON string.
  String toJson() => json.encode(toMap());

  SetData copyWith({
    String? id,
    String? name,
    String? series,
    dynamic printedTotal,
    dynamic total,
    Legalities? legalities,
    String? ptcgoCode,
    String? releaseDate,
    String? updatedAt,
    SetImages? setImages,
  }) {
    return SetData(
      id: id ?? this.id,
      name: name ?? this.name,
      series: series ?? this.series,
      printedTotal: printedTotal ?? this.printedTotal,
      total: total ?? this.total,
      legalities: legalities ?? this.legalities,
      ptcgoCode: ptcgoCode ?? this.ptcgoCode,
      releaseDate: releaseDate ?? this.releaseDate,
      updatedAt: updatedAt ?? this.updatedAt,
      setImages: setImages ?? this.setImages,
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
      setImages,
    ];
  }
}
