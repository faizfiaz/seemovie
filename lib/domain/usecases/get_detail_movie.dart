import 'package:movie_test_app/core/utils/pair.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/domain/repository/movie_repository.dart';

class GetDetailMovie {
  final MovieRepository repository;

  GetDetailMovie(this.repository);

  Future<Pair<DetailMovie, bool>> call(int id) async {
    final movie = await repository.getDetailMovie(id: id);
    final isFavorite = repository.isMovieFavorite(id: id);
    return Pair(movie, isFavorite);
  }
}
