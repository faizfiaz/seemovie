import 'package:get/get.dart';
import 'package:movie_test_app/data/models/base/api_exception.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/domain/usecases/get_detail_movie.dart';

class MovieScreenArguments {
  final int id;
  final String? title;
  final String? backdropPath;
  final String? tagline;

  MovieScreenArguments({required this.id, this.title, this.backdropPath, this.tagline});
}

class MovieDetailScreenController extends GetxController {
  final GetDetailMovie getDetailMovie;
  late final MovieScreenArguments movie;

  final Rx<DetailMovie?> detail = Rx<DetailMovie?>(null);
  final isLoading = false.obs;
  final error = RxnString();

  MovieDetailScreenController({required this.getDetailMovie});

  @override
  void onInit() {
    super.onInit();
    movie = Get.arguments as MovieScreenArguments;
    _fetchMovieDetail();
  }

  Future<void> _fetchMovieDetail() async {
    try {
      isLoading.value = true;
      final result = await getDetailMovie(movie.id);
      detail.value = result;
    } on ApiException catch (e) {
      error.value = 'Failed to fetch detail: ${e.getMessage()}';
    } finally {
      isLoading.value = false;
    }
  }
}
