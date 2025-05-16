import 'package:movie_test_app/core/utils/pair.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/domain/entities/movie_item.dart';

abstract class MovieRepository {
  Future<Pair<int, List<MovieItem>>> getNowPlayingMovies({int page = 1});

  Future<DetailMovie> getDetailMovie({required int id});

  Future<Pair<int, List<MovieItem>>> searchMovies({int page = 1, required String query});
}
