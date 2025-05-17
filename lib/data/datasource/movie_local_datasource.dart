import 'package:hive/hive.dart';
import 'package:movie_test_app/core/hive/app_hive.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';

class MovieLocalDatasource {
  final Box<DetailMovie> box = Hive.box<DetailMovie>(AppHive.favoriteMoviesBox);

  void toogleFavoriteMovie({required DetailMovie movie}) {
    if (!box.containsKey(movie.id)) {
      box.put(movie.id, movie);
    } else {
      box.delete(movie.id);
    }
  }

  List<DetailMovie> getFavoriteMovies() {
    final box = Hive.box<DetailMovie>('favorite_movies');
    return box.values.toList();
  }

  bool isMovieFavorite({required int id}) {
    return box.containsKey(id);
  }
}
