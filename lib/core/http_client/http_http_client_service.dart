import 'dart:convert';

import 'package:tractian_challenge/core/exceptions/http_response_exception.dart';
import 'package:tractian_challenge/core/http_client/i_http_client_service.dart';
import 'package:tractian_challenge/core/http_client/response_data.dart';
import 'package:http/http.dart' as http;

class HttpIHttpClient implements IHttpClient {
  @override
  Future<ResponseData> get(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode != 200) {
        throw HttpResponseException(
            message: '${response.statusCode} - ${response.body}');
      }
      return ResponseData(
          url: url,
          statusCode: response.statusCode,
          data: jsonDecode(response.body));
    } on HttpResponseException catch (_) {
      rethrow;
    } catch (e) {
      throw HttpResponseException(message: e.toString());
    }
  }
}
