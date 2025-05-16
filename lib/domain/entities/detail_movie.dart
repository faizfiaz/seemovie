import 'package:movie_test_app/data/models/response_detail_movie.dart';

class DetailMovie {
  final int? id;
  final String? title;
  final String? originalTitle;
  final String? overview;
  final String? tagline;
  final DateTime? releaseDate;
  final String? originalLanguage;
  final String? status;
  final String? backdropPath;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;

  const DetailMovie({
    this.id,
    this.title,
    this.originalTitle,
    this.overview,
    this.tagline,
    this.releaseDate,
    this.originalLanguage,
    this.status,
    this.backdropPath,
    this.posterPath,
    this.productionCompanies,
  });
}
