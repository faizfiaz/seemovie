import 'package:hive/hive.dart';
import 'package:movie_test_app/data/models/response_detail_movie.dart';

part 'detail_movie.g.dart';

@HiveType(typeId: 1)
class DetailMovie {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? originalTitle;
  @HiveField(3)
  final String? overview;
  @HiveField(4)
  final String? tagline;
  @HiveField(5)
  final DateTime? releaseDate;
  @HiveField(6)
  final String? originalLanguage;
  @HiveField(7)
  final String? status;
  @HiveField(8)
  final String? backdropPath;
  @HiveField(9)
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
