import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/domain/repository/movie_repository.dart';

class GetFavoriteMovie {
  final MovieRepository repository;

  GetFavoriteMovie(this.repository);

  List<DetailMovie> call() {
    return repository.getFavoriteMovies();
  }
}
