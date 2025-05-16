import 'package:movie_test_app/core/utils/pair.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/domain/entities/home_movie_item.dart';
import 'package:movie_test_app/domain/entities/search_movie_item.dart';

abstract class MovieRepository {
  Future<Pair<int, List<HomeMovieItem>>> getNowPlayingMovies({int page = 1});

  Future<DetailMovie> getDetailMovie({required int id});

  Future<Pair<int, List<SearchMovieItem>>> searchMovies({int page = 1, required String query});

  void toogleMovieFavorite({required DetailMovie movie});

  List<DetailMovie> getFavoriteMovies();

  bool isMovieFavorite({required int id});
}
