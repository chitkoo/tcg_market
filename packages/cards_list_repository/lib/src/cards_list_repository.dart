import 'package:cards_list_api/cards_list_api.dart';
import 'package:cards_list_repository/src/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class CardsListReporitory {
  CardsListReporitory({
    CardsListApiClient? cardsListApiClient,
  }) : _cardsListApiClient = cardsListApiClient ?? CardsListApiClient();

  final CardsListApiClient _cardsListApiClient;

  Future<CardsListData> getCardsList() async {
    Response response = await _cardsListApiClient.getCardsList();

    if (response.statusCode == 200 || response.statusCode == 201) {
      return compute(CardsListData.fromJson, response.body);
    } else {
      return const CardsListData(data: []);
    }
  }
}
