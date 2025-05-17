import 'package:dio/dio.dart';
import 'package:movie_test_app/data/models/base/api_exception.dart';

class FakeApiException {
  static ApiException get fake {
    final dioError = DioException(
      requestOptions: RequestOptions(path: '/search/movie'),
      message: 'Something went wrong',
      type: DioExceptionType.connectionError,
    );

    return ApiException(dioError);
  }
}
