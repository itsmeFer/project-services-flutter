import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api.dart';
import 'exception.dart';
import 'params/register_params.dart';
import 'response.dart';
import 'params/login_params.dart';
import 'response_data/login.dart';
import 'response_data/register.dart';

class UsersApi extends ApiClient {
  Future<ApiResponse<LoginData>> login({required LoginParams params}) async {
    try {
      Response response = await dio.post('login', data: params.toJson());

      final ApiResponse<LoginData> apiData =
          ApiResponse<LoginData>.fromJson(response.data);

      return apiData;
    } on DioException catch (e) {
      if (e.response != null) {
        var message = e.response!.data['message'][0];
        throw ApiException(
            message: message, code: e.response!.statusCode ?? 500);
      } else {
        debugPrint('Type Error Response : ${e.type}');
      }
      throw Exception(e.toString());
    }
  }

  Future<ApiResponse<RegisterData>> register(
      {required RegisterParams params}) async {
    try {
      Response response = await dio.post('register', data: params.toJson());

      final ApiResponse<RegisterData> apiData =
          ApiResponse<RegisterData>.fromJson(response.data);

      return apiData;
    } on DioException catch (e) {
      if (e.response != null) {
        var message = e.response!.data['message'][0];
        throw ApiException(
            message: message, code: e.response!.statusCode ?? 500);
      } else {
        debugPrint('Type Error Response : ${e.type}');
      }
      throw Exception(e.toString());
    }
  }
}
