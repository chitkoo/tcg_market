// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cards_list_repository/src/models/cards_list_data/images.dart';
import 'package:equatable/equatable.dart';

import 'attack.dart';
import 'cardmarket.dart';
import 'legalities.dart';
import 'resistance.dart';
import 'set_data.dart';
import 'tcgplayer.dart';
import 'weakness.dart';

class CardData extends Equatable {
  final String? id;
  final String? name;
  final String? supertype;
  final List<dynamic>? subtypes;
  final String? hp;
  final List<dynamic>? types;
  final String? evolvesFrom;
  final List<Attack>? attacks;
  final List<Weakness>? weaknesses;
  final List<Resistance>? resistances;
  final List<dynamic>? retreatCost;
  final dynamic convertedRetreatCost;
  final SetData? setData;
  final String? number;
  final String? artist;
  final String? rarity;
  final String? flavorText;
  final List<dynamic>? nationalPokedexNumbers;
  final Legalities? legalities;
  final Images? images;
  final Tcgplayer? tcgplayer;
  final Cardmarket? cardmarket;

  const CardData({
    this.id,
    this.name,
    this.supertype,
    this.subtypes,
    this.hp,
    this.types,
    this.evolvesFrom,
    this.attacks,
    this.weaknesses,
    this.resistances,
    this.retreatCost,
    this.convertedRetreatCost,
    this.setData,
    this.number,
    this.artist,
    this.rarity,
    this.flavorText,
    this.nationalPokedexNumbers,
    this.legalities,
    this.images,
    this.tcgplayer,
    this.cardmarket,
  });

  factory CardData.fromMap(Map<String, dynamic> data) => CardData(
        id: data['id'] as String?,
        name: data['name'] as String?,
        supertype: data['supertype'] as String?,
        subtypes: data['subtypes'] as List<dynamic>?,
        hp: data['hp'] as String?,
        types: data['types'] as List<dynamic>?,
        evolvesFrom: data['evolvesFrom'] as String?,
        attacks: (data['attacks'] as List<dynamic>?)
            ?.map((e) => Attack.fromMap(e as Map<String, dynamic>))
            .toList(),
        weaknesses: (data['weaknesses'] as List<dynamic>?)
            ?.map((e) => Weakness.fromMap(e as Map<String, dynamic>))
            .toList(),
        resistances: (data['resistances'] as List<dynamic>?)
            ?.map((e) => Resistance.fromMap(e as Map<String, dynamic>))
            .toList(),
        retreatCost: data['retreatCost'] as List<dynamic>?,
        convertedRetreatCost: data['convertedRetreatCost'] as dynamic,
        setData: data['set'] == null
            ? null
            : SetData.fromMap(data['set'] as Map<String, dynamic>),
        number: data['number'] as String?,
        artist: data['artist'] as String?,
        rarity: data['rarity'] as String?,
        flavorText: data['flavorText'] as String?,
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
        cardmarket: data['cardmarket'] == null
            ? null
            : Cardmarket.fromMap(data['cardmarket'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'supertype': supertype,
        'subtypes': subtypes,
        'hp': hp,
        'types': types,
        'evolvesFrom': evolvesFrom,
        'attacks': attacks?.map((e) => e.toMap()).toList(),
        'weaknesses': weaknesses?.map((e) => e.toMap()).toList(),
        'resistances': resistances?.map((e) => e.toMap()).toList(),
        'retreatCost': retreatCost,
        'convertedRetreatCost': convertedRetreatCost,
        'set': setData?.toMap(),
        'number': number,
        'artist': artist,
        'rarity': rarity,
        'flavorText': flavorText,
        'nationalPokedexNumbers': nationalPokedexNumbers,
        'legalities': legalities?.toMap(),
        'images': images?.toMap(),
        'tcgplayer': tcgplayer?.toMap(),
        'cardmarket': cardmarket?.toMap(),
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
    String? evolvesFrom,
    List<Attack>? attacks,
    List<Weakness>? weaknesses,
    List<Resistance>? resistances,
    List<dynamic>? retreatCost,
    dynamic convertedRetreatCost,
    SetData? setData,
    String? number,
    String? artist,
    String? rarity,
    String? flavorText,
    List<dynamic>? nationalPokedexNumbers,
    Legalities? legalities,
    Images? images,
    Tcgplayer? tcgplayer,
    Cardmarket? cardmarket,
  }) {
    return CardData(
      id: id ?? this.id,
      name: name ?? this.name,
      supertype: supertype ?? this.supertype,
      subtypes: subtypes ?? this.subtypes,
      hp: hp ?? this.hp,
      types: types ?? this.types,
      evolvesFrom: evolvesFrom ?? this.evolvesFrom,
      attacks: attacks ?? this.attacks,
      weaknesses: weaknesses ?? this.weaknesses,
      resistances: resistances ?? this.resistances,
      retreatCost: retreatCost ?? this.retreatCost,
      convertedRetreatCost: convertedRetreatCost ?? this.convertedRetreatCost,
      setData: setData ?? this.setData,
      number: number ?? this.number,
      artist: artist ?? this.artist,
      rarity: rarity ?? this.rarity,
      flavorText: flavorText ?? this.flavorText,
      nationalPokedexNumbers: nationalPokedexNumbers ?? this.nationalPokedexNumbers,
      legalities: legalities ?? this.legalities,
      images: images ?? this.images,
      tcgplayer: tcgplayer ?? this.tcgplayer,
      cardmarket: cardmarket ?? this.cardmarket,
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
      evolvesFrom,
      attacks,
      weaknesses,
      resistances,
      retreatCost,
      convertedRetreatCost,
      setData,
      number,
      artist,
      rarity,
      flavorText,
      nationalPokedexNumbers,
      legalities,
      images,
      tcgplayer,
      cardmarket,
    ];
  }
}
