import 'package:movie_test_app/core/utils/pair.dart';
import 'package:movie_test_app/domain/entities/search_movie_item.dart';
import 'package:movie_test_app/domain/repository/movie_repository.dart';

class SearchMovie {
  final MovieRepository repository;

  SearchMovie(this.repository);

  Future<Pair<int, List<SearchMovieItem>>> call({int page = 1, required String query}) async {
    return await repository.searchMovies(page: page, query: query);
  }
}
