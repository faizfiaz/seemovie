import 'package:get/get.dart';
import 'package:movie_test_app/domain/usecases/get_favorite_movie.dart';
import 'package:movie_test_app/features/favorites/controller/favorites_screen_controller.dart';

class FavoritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritesScreenController(Get.find()));
    Get.lazyPut(() => GetFavoriteMovie(Get.find()));
  }
}
