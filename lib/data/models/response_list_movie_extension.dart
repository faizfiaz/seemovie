import 'package:movie_test_app/data/models/response_list_movie.dart';
import 'package:movie_test_app/domain/entities/movie_item.dart';

extension ResponseListMovieExtenstion on ResponseListMovie {
  List<MovieItem> get movies => results?.movies ?? [];
}

extension ResultExtension on List<Result> {
  List<MovieItem> get movies =>
      map(
        (movie) => MovieItem(
          id: movie.id,
          title: movie.title,
          overview: movie.overview,
          posterPath: movie.posterPath,
          backdropPath: movie.backdropPath,
          voteAverage: movie.voteAverage,
          voteCount: movie.voteCount,
        ),
      ).toList();
}
