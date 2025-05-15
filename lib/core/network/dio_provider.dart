import 'package:dio/dio.dart';
import 'package:dio_request_inspector/dio_request_inspector.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_test_app/core/constants/app_constants.dart';

final DioRequestInspector inspector = DioRequestInspector(isInspectorEnabled: kDebugMode || AppConstants.isDebug, showSummary: false);

class DioProvider {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.apiUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer ${AppConstants.readToken}', 'Accept': 'application/json'},
      ),
    );

    dio.interceptors.add(inspector.getDioRequestInterceptor());

    return dio;
  }
}
