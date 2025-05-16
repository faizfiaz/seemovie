import 'package:movie_test_app/core/utils/pair.dart';
import 'package:movie_test_app/domain/entities/home_movie_item.dart';
import 'package:movie_test_app/domain/repository/movie_repository.dart';

class GetNowPlaying {
  final MovieRepository repository;

  GetNowPlaying(this.repository);

  Future<Pair<int, List<HomeMovieItem>>> call({int page = 1}) async {
    return await repository.getNowPlayingMovies(page: page);
  }
}
