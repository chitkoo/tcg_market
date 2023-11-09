import 'package:cards_list_api/cards_list_api.dart';
import 'package:cards_list_repository/src/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class CardsListReporitory {
  CardsListReporitory({
    CardsListApiClient? cardsListApiClient,
  }) : _cardsListApiClient = cardsListApiClient ?? CardsListApiClient();

  final CardsListApiClient _cardsListApiClient;

  Future<CardsListEntity> getCardsList() async {
    Response response = await _cardsListApiClient.getCardsList();

    return compute(CardsListEntity.fromJson, response.body);
  }
}