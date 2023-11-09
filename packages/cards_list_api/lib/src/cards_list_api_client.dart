import 'package:tcg_api/tcg_api.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CardsListApiClient {
  CardsListApiClient({
    TcgApiClient? tcgApiClient,
  }) : _tcgApiClient = tcgApiClient ?? TcgApiClient(httpClient: http.Client());

  final TcgApiClient _tcgApiClient;

  Future<Response> getCardsList({
    String page = '1',
    String pageSize = '10',
  }) async {
    String endPoint = '/v2/cards';
    Map<String, String> query = {
      'page': page,
      'pageSize': pageSize,
    };

    Response response = await _tcgApiClient.get(
      endPoint: endPoint,
      query: query,
    );

    return response;
  }
}
