class ResponseData {
  final String url;
  final int? statusCode;
  final dynamic data;

  ResponseData(
      {required this.url, required this.statusCode, required this.data});
}
