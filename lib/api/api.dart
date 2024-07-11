import 'package:dio/dio.dart';

abstract class ApiClient {
  final Dio _dio = Dio();

  ApiClient() {
    _dio.options.headers["content-type"] = 'application/json';
    // NOTE: Change the baseUrl to your own API URL
    _dio.options.baseUrl = 'http://10.0.2.2:8000/api/';
    _dio.options.connectTimeout = const Duration(seconds: 10);
  }

  Dio get dio => _dio;
}
