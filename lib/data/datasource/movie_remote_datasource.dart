import 'package:dio/dio.dart';
import 'package:movie_test_app/core/utils/pair.dart';
import 'package:movie_test_app/data/models/base/api_exception.dart';
import 'package:movie_test_app/data/models/response_detail_movie.dart';
import 'package:movie_test_app/data/models/response_detail_movie_extension.dart';
import 'package:movie_test_app/data/models/response_list_movie.dart';
import 'package:movie_test_app/data/models/response_list_movie_extension.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/domain/entities/movie_item.dart';

class MovieRemoteDataSource {
  final Dio _dio;

  MovieRemoteDataSource(this._dio);

  Future<Pair<int, List<MovieItem>>> getNowPlayingMovies({int page = 1}) async {
    try {
      final response = await _dio.get('/movie/now_playing?language=en-US&page=$page');
      final data = ResponseListMovie.fromJson(response.data);
      return Pair(data.totalPages ?? 1, data.movies);
    } on DioException catch (e) {
      throw ApiException(e);
    }
  }

  Future<DetailMovie> getDetailMovie({required int id}) async {
    try {
      final response = await _dio.get('/movie/$id?language=en-US');
      final data = ResponseDetailMovie.fromJson(response.data);
      return data.toEntity();
    } on DioException catch (e) {
      throw ApiException(e);
    }
  }

  Future<Pair<int, List<MovieItem>>> searchMovie({int page = 1, required String query}) async {
    try {
      final response = await _dio.get('/search/movie?query=$query&language=en-US&page=$page');
      final data = ResponseListMovie.fromJson(response.data);
      return Pair(data.totalPages ?? 1, data.movies);
    } on DioException catch (e) {
      throw ApiException(e);
    }
  }
}
