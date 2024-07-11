class ApiException implements Exception {
  final String message;
  final int code;

  ApiException({required this.message, required this.code});

  @override
  String toString() {
    return 'ApiException{message: $message, code: $code}';
  }
}
