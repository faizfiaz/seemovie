import 'package:get/get.dart';
import 'package:movie_test_app/domain/usecases/search_movie.dart';
import 'package:movie_test_app/features/search/controller/search_screen_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchScreenController(Get.find()));
    Get.lazyPut(() => SearchMovie(Get.find()));
  }
}
