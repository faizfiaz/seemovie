import 'package:get/get.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/domain/usecases/get_favorite_movie.dart';

class FavoritesScreenController extends GetxController {
  final GetFavoriteMovie getFavoriteMovie;

  FavoritesScreenController(this.getFavoriteMovie);

  var movies = <DetailMovie>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavoriteMovies();
  }

  void fetchFavoriteMovies() {
    movies.value = getFavoriteMovie();
  }
}
