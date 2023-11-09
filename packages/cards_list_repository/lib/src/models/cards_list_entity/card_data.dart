import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'attack.dart';
import 'images.dart';
import 'legalities.dart';
import 'set.dart';
import 'tcgplayer.dart';
import 'weakness.dart';

class CardData extends Equatable {
  final String? id;
  final String? name;
  final String? supertype;
  final List<dynamic>? subtypes;
  final String? hp;
  final List<dynamic>? types;
  final List<dynamic>? evolvesTo;
  final List<dynamic>? rules;
  final List<Attack>? attacks;
  final List<Weakness>? weaknesses;
  final List<dynamic>? retreatCost;
  final dynamic convertedRetreatCost;
  final Set? datumSet;
  final String? number;
  final String? artist;
  final String? rarity;
  final List<dynamic>? nationalPokedexNumbers;
  final Legalities? legalities;
  final Images? images;
  final Tcgplayer? tcgplayer;

  const CardData({
    this.id,
    this.name,
    this.supertype,
    this.subtypes,
    this.hp,
    this.types,
    this.evolvesTo,
    this.rules,
    this.attacks,
    this.weaknesses,
    this.retreatCost,
    this.convertedRetreatCost,
    this.datumSet,
    this.number,
    this.artist,
    this.rarity,
    this.nationalPokedexNumbers,
    this.legalities,
    this.images,
    this.tcgplayer,
  });

  factory CardData.fromMap(Map<String, dynamic> data) => CardData(
        id: data['id'] as String?,
        name: data['name'] as String?,
        supertype: data['supertype'] as String?,
        subtypes: data['subtypes'] as List<dynamic>?,
        hp: data['hp'] as String?,
        types: data['types'] as List<dynamic>?,
        evolvesTo: data['evolvesTo'] as List<dynamic>?,
        rules: data['rules'] as List<dynamic>?,
        attacks: (data['attacks'] as List<dynamic>?)
            ?.map((e) => Attack.fromMap(e as Map<String, dynamic>))
            .toList(),
        weaknesses: (data['weaknesses'] as List<dynamic>?)
            ?.map((e) => Weakness.fromMap(e as Map<String, dynamic>))
            .toList(),
        retreatCost: data['retreatCost'] as List<dynamic>?,
        convertedRetreatCost: data['convertedRetreatCost'] as dynamic,
        datumSet: data['set'] == null
            ? null
            : Set.fromMap(data['set'] as Map<String, dynamic>),
        number: data['number'] as String?,
        artist: data['artist'] as String?,
        rarity: data['rarity'] as String?,
        nationalPokedexNumbers:
            data['nationalPokedexNumbers'] as List<dynamic>?,
        legalities: data['legalities'] == null
            ? null
            : Legalities.fromMap(data['legalities'] as Map<String, dynamic>),
        images: data['images'] == null
            ? null
            : Images.fromMap(data['images'] as Map<String, dynamic>),
        tcgplayer: data['tcgplayer'] == null
            ? null
            : Tcgplayer.fromMap(data['tcgplayer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'supertype': supertype,
        'subtypes': subtypes,
        'hp': hp,
        'types': types,
        'evolvesTo': evolvesTo,
        'rules': rules,
        'attacks': attacks?.map((e) => e.toMap()).toList(),
        'weaknesses': weaknesses?.map((e) => e.toMap()).toList(),
        'retreatCost': retreatCost,
        'convertedRetreatCost': convertedRetreatCost,
        'set': datumSet?.toMap(),
        'number': number,
        'artist': artist,
        'rarity': rarity,
        'nationalPokedexNumbers': nationalPokedexNumbers,
        'legalities': legalities?.toMap(),
        'images': images?.toMap(),
        'tcgplayer': tcgplayer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CardData].
  factory CardData.fromJson(String data) {
    return CardData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CardData] to a JSON string.
  String toJson() => json.encode(toMap());

  CardData copyWith({
    String? id,
    String? name,
    String? supertype,
    List<dynamic>? subtypes,
    String? hp,
    List<dynamic>? types,
    List<dynamic>? evolvesTo,
    List<dynamic>? rules,
    List<Attack>? attacks,
    List<Weakness>? weaknesses,
    List<dynamic>? retreatCost,
    dynamic convertedRetreatCost,
    Set? datumSet,
    String? number,
    String? artist,
    String? rarity,
    List<dynamic>? nationalPokedexNumbers,
    Legalities? legalities,
    Images? images,
    Tcgplayer? tcgplayer,
  }) {
    return CardData(
      id: id ?? this.id,
      name: name ?? this.name,
      supertype: supertype ?? this.supertype,
      subtypes: subtypes ?? this.subtypes,
      hp: hp ?? this.hp,
      types: types ?? this.types,
      evolvesTo: evolvesTo ?? this.evolvesTo,
      rules: rules ?? this.rules,
      attacks: attacks ?? this.attacks,
      weaknesses: weaknesses ?? this.weaknesses,
      retreatCost: retreatCost ?? this.retreatCost,
      convertedRetreatCost: convertedRetreatCost ?? this.convertedRetreatCost,
      datumSet: datumSet ?? this.datumSet,
      number: number ?? this.number,
      artist: artist ?? this.artist,
      rarity: rarity ?? this.rarity,
      nationalPokedexNumbers:
          nationalPokedexNumbers ?? this.nationalPokedexNumbers,
      legalities: legalities ?? this.legalities,
      images: images ?? this.images,
      tcgplayer: tcgplayer ?? this.tcgplayer,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      supertype,
      subtypes,
      hp,
      types,
      evolvesTo,
      rules,
      attacks,
      weaknesses,
      retreatCost,
      convertedRetreatCost,
      datumSet,
      number,
      artist,
      rarity,
      nationalPokedexNumbers,
      legalities,
      images,
      tcgplayer,
    ];
  }
}
