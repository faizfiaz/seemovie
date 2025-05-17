import 'package:movie_test_app/data/models/response_detail_movie.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';

extension ResponseDetailMovieExtension on ResponseDetailMovie {
  DetailMovie toEntity() {
    return DetailMovie(
      id: id,
      title: title,
      originalTitle: originalTitle,
      overview: overview,
      tagline: tagline,
      releaseDate: releaseDate,
      originalLanguage: originalLanguage,
      status: status,
      backdropPath: backdropPath,
      posterPath: posterPath,
      productionCompanies: productionCompanies,
    );
  }
}
