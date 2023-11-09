import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:http/http.dart';

class TcgApiClient {
  TcgApiClient({
    required http.Client httpClient,
  }) : _httpRetryClient = RetryClient(httpClient);

  final RetryClient _httpRetryClient;

  static const _baseUrl = 'api.pokemontcg.io';

  Future<Response> get({
    required String endPoint,
    required Map<String, String> query,
  }) async {
    final request = Uri.https(
      _baseUrl,
      endPoint,
      query,
    );

    Response response = await _httpRetryClient.get(request);

    return response;
  }
}
