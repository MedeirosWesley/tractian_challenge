class HttpResponseException implements Exception {
  final String message;

  HttpResponseException({
    required this.message,
  });

  @override
  String toString() {
    return 'HttpResponseException: $message';
  }
}
