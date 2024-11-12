import 'package:tractian_challenge/core/http_client/response_data.dart';

abstract class IHttpClient {
  Future<ResponseData> get(String url);
}
