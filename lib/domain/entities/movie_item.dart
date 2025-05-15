class MovieItem {
  final int? id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final double? voteAverage;
  final int? voteCount;

  const MovieItem({this.id, this.title, this.overview, this.backdropPath, this.posterPath, this.voteAverage, this.voteCount});
}
