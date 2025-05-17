import 'package:movie_test_app/data/models/response_list_movie.dart';
import 'package:movie_test_app/domain/entities/home_movie_item.dart';
import 'package:movie_test_app/domain/entities/search_movie_item.dart';

extension ResponseListMovieExtenstion on ResponseListMovie {
  List<HomeMovieItem> get movies => results?.homeMovieItem ?? [];
  List<SearchMovieItem> get searchMovies => results?.searchMovieItem ?? [];
}

extension ResultExtension on List<Result> {
  List<HomeMovieItem> get homeMovieItem => map((movie) => HomeMovieItem(id: movie.id, posterPath: movie.posterPath)).toList();
  List<SearchMovieItem> get searchMovieItem =>
      map(
        (movie) => SearchMovieItem(id: movie.id, posterPath: movie.posterPath, title: movie.title, voteAverage: movie.voteAverage),
      ).toList();
}
