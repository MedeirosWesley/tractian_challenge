import 'package:dio/dio.dart';
import 'package:tractian_challenge/core/exceptions/http_response_exception.dart';
import 'package:tractian_challenge/core/http_client/i_http_client_service.dart';
import 'package:tractian_challenge/core/http_client/response_data.dart';

class DioIHttpClient implements IHttpClient {
  final _client = Dio();
  @override
  Future<ResponseData> get(String url) async {
    try {
      final response = await _client.get(url);
      if (response.statusCode != 200) {
        throw HttpResponseException(
            message: '${response.statusCode} - ${response.data}');
      }
      return ResponseData(
          url: url, statusCode: response.statusCode, data: response.data);
    } on DioException catch (e) {
      throw HttpResponseException(message: e.message ?? 'Unknown error');
    } on HttpResponseException catch (_) {
      rethrow;
    } catch (e) {
      throw HttpResponseException(message: e.toString());
    }
  }
}
