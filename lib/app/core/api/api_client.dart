import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../config/app_config.dart';

class ApiClient {
  ApiClient._();

  static final ApiClient _instance = ApiClient._();
  static ApiClient get instance => _instance;

  late final Dio dio;

  Future<void> init() async {
    const baseUrl = AppConfig.baseUrl;
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
