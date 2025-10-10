import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  ApiClient._();

  static final ApiClient _instance = ApiClient._();
  static ApiClient get instance => _instance;

  late final Dio dio;

  Future<void> init() async {
    const baseUrl = 'http://192.168.15.6:8080';
    dio = Dio(BaseOptions(baseUrl: baseUrl))
      ..interceptors.add(
        LogInterceptor(
          request: kDebugMode,
          requestBody: kDebugMode,
          responseBody: kDebugMode,
          responseHeader: false,
        ),
      );
  }
}
