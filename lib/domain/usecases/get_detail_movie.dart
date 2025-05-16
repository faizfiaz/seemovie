import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/domain/repository/movie_repository.dart';

class GetDetailMovie {
  final MovieRepository repository;

  GetDetailMovie(this.repository);

  Future<DetailMovie> call(int id) async {
    return await repository.getDetailMovie(id);
  }
}
