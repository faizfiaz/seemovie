import 'package:dio/dio.dart';
import 'package:movie_test_app/data/models/base/api_constants.dart';

class ApiException implements Exception {
  ApiException(this._dioError);

  final DioException _dioError;

  String getMessage() {
    const String otherErrorMessage = 'Terjadi Kesalahan Pada Sistem';
    if (_dioError.type == DioExceptionType.badResponse) {
      try {
        final data = _dioError.response?.data as Map<String, dynamic>;
        return data['message'] ?? otherErrorMessage;
      } catch (_) {
        return otherErrorMessage;
      }
    } else {
      return otherErrorMessage;
    }
  }

  String getErrorCode() {
    const String otherErrorCode = 'OTHER_ERROR_CODE';
    if (_dioError.type == DioExceptionType.badResponse) {
      try {
        final data = _dioError.response?.data as Map<String, dynamic>;
        return data['code'] ?? otherErrorCode;
      } catch (_) {
        return otherErrorCode;
      }
    } else {
      return otherErrorCode;
    }
  }

  int getHttpCode() {
    return _dioError.response?.statusCode ?? -1;
  }

  Headers? getHeaders() {
    return _dioError.response?.headers;
  }

  ApiErrorType getErrorType() {
    switch (_dioError.type) {
      case DioExceptionType.badResponse:
        return ApiErrorType.badResponse;
      case DioExceptionType.connectionTimeout:
        return ApiErrorType.connectionTimeout;
      case DioExceptionType.sendTimeout:
        return ApiErrorType.sendTimeout;
      case DioExceptionType.receiveTimeout:
        return ApiErrorType.receiveTimeout;
      case DioExceptionType.cancel:
        return ApiErrorType.cancel;
      case DioExceptionType.unknown:
        return ApiErrorType.unknown;
      case DioExceptionType.badCertificate:
        return ApiErrorType.badCertificate;
      case DioExceptionType.connectionError:
        return ApiErrorType.connectionError;
    }
  }

  dynamic getData() {
    return _dioError.response?.data;
  }
}
