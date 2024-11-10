import 'dart:convert';

import 'package:tractian_challenge/core/exceptions/http_response_exception.dart';
import 'package:tractian_challenge/core/http_client/response_data.dart';
import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future<ResponseData> get(String url);
}
