import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/domain/repository/movie_repository.dart';

class FavoritMovie {
  final MovieRepository repository;

  FavoritMovie(this.repository);

  void call({required DetailMovie detailMovie}) async {
    return repository.toogleMovieFavorite(movie: detailMovie);
  }
}
