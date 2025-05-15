import 'package:get/get.dart';
import 'package:movie_test_app/core/network/dio_provider.dart';
import 'package:movie_test_app/data/datasource/movie_local_datasource.dart';
import 'package:movie_test_app/data/datasource/movie_remote_datasource.dart';
import 'package:movie_test_app/domain/repository/movie_repository.dart';
import 'package:movie_test_app/domain/repository/movie_repository_impl.dart';
import 'package:movie_test_app/routes/app_navigator.dart';
import 'package:movie_test_app/routes/app_navigator_impl.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DioProvider.createDio());
    Get.put<AppNavigator>(AppNavigatorImpl());

    //datasource binding
    Get.lazyPut(() => MovieRemoteDataSource(Get.find()));
    Get.lazyPut(() => MovieLocalDatasource());

    //repository binding
    Get.lazyPut<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: Get.find(), localDataSource: Get.find()));
  }
}
