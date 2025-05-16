import 'package:json_annotation/json_annotation.dart';
import 'package:movie_test_app/core/utils/date_time_parser.dart';

part 'response_list_movie.g.dart';

@JsonSerializable()
class ResponseListMovie {
  ResponseListMovie({required this.dates, required this.page, required this.results, required this.totalPages, required this.totalResults});

  final Dates? dates;
  final int? page;
  final List<Result>? results;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @JsonKey(name: 'total_results')
  final int? totalResults;

  factory ResponseListMovie.fromJson(Map<String, dynamic> json) => _$ResponseListMovieFromJson(json);
}

@JsonSerializable()
class Dates {
  Dates({required this.maximum, required this.minimum});

  @JsonKey(fromJson: DateTimeParser.parseDate)
  final DateTime? maximum;
  @JsonKey(fromJson: DateTimeParser.parseDate)
  final DateTime? minimum;

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
}

@JsonSerializable()
class Result {
  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool? adult;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  final int? id;

  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  final double? popularity;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'release_date', fromJson: DateTimeParser.parseDate)
  final DateTime? releaseDate;
  final String? title;
  final bool? video;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
