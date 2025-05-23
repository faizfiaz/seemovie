import 'package:json_annotation/json_annotation.dart';
import 'package:movie_test_app/core/utils/date_time_parser.dart';

part 'response_detail_movie.g.dart';

@JsonSerializable()
class ResponseDetailMovie {
  ResponseDetailMovie({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool? adult;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'belongs_to_collection')
  final dynamic belongsToCollection;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final int? id;

  @JsonKey(name: 'imdb_id')
  final String? imdbId;

  @JsonKey(name: 'origin_country')
  final List<String>? originCountry;

  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  final double? popularity;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'production_companies')
  final List<ProductionCompany>? productionCompanies;

  @JsonKey(name: 'production_countries')
  final List<ProductionCountry>? productionCountries;

  @JsonKey(name: 'release_date', fromJson: DateTimeParser.parseDate)
  final DateTime? releaseDate;
  final int? revenue;
  final int? runtime;

  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguage>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  factory ResponseDetailMovie.fromJson(Map<String, dynamic> json) => _$ResponseDetailMovieFromJson(json);
}

@JsonSerializable()
class Genre {
  Genre({required this.id, required this.name});

  final int? id;
  final String? name;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@JsonSerializable()
class ProductionCompany {
  ProductionCompany({required this.id, required this.logoPath, required this.name, required this.originCountry});

  final int? id;

  @JsonKey(name: 'logo_path')
  final String? logoPath;
  final String? name;

  @JsonKey(name: 'origin_country')
  final String? originCountry;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);
}

@JsonSerializable()
class ProductionCountry {
  ProductionCountry({required this.iso31661, required this.name});

  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;
  final String? name;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => _$ProductionCountryFromJson(json);
}

@JsonSerializable()
class SpokenLanguage {
  SpokenLanguage({required this.englishName, required this.iso6391, required this.name});

  @JsonKey(name: 'english_name')
  final String? englishName;

  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  final String? name;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => _$SpokenLanguageFromJson(json);
}
