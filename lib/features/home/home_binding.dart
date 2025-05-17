import 'package:get/get.dart';
import 'package:movie_test_app/domain/usecases/get_now_playing.dart';
import 'package:movie_test_app/features/home/controller/home_screen_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController(Get.find()));
    Get.lazyPut(() => GetNowPlaying(Get.find()));
  }
}
