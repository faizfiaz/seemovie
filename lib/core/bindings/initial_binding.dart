import 'package:get/get.dart';
import 'package:movie_test_app/core/network/dio_provider.dart';
import 'package:movie_test_app/routes/app_navigator.dart';
import 'package:movie_test_app/routes/app_navigator_impl.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DioProvider.createDio());
    Get.lazyPut<AppNavigator>(() => AppNavigatorImpl(Get.key));
  }
}
