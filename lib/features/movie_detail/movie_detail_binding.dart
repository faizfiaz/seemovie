import 'package:get/get.dart';
import 'package:movie_test_app/domain/usecases/get_detail_movie.dart';
import 'package:movie_test_app/features/movie_detail/controller/movie_detail_controller.dart';

class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailController(getDetailMovie: Get.find()));
    Get.lazyPut(() => GetDetailMovie(Get.find()));
  }
}
