import 'package:hive/hive.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:path_provider/path_provider.dart';

class AppHive {
  static const String favoriteMoviesBox = 'favorite_movies';

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive
      ..init(dir.path)
      ..registerAdapter(DetailMovieAdapter());

    await Hive.openBox<DetailMovie>(favoriteMoviesBox);
  }
}
