import 'package:dio/dio.dart';
import 'package:dio_request_inspector/dio_request_inspector.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_test_app/core/constants/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final DioRequestInspector inspector = DioRequestInspector(isInspectorEnabled: kDebugMode || AppConstants.isDebug, showSummary: false);
final PrettyDioLogger _prettyDioLogger = PrettyDioLogger(
  request: true,
  requestHeader: true,
  requestBody: true,
  responseHeader: true,
  responseBody: true,
  error: true,
);

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
    dio.interceptors.add(_prettyDioLogger);

    return dio;
  }
}
