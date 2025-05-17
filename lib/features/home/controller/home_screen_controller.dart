import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_test_app/domain/entities/home_movie_item.dart';
import 'package:movie_test_app/domain/usecases/get_now_playing.dart';
import 'package:movie_test_app/main.dart';

class HomeScreenController extends GetxController {
  final GetNowPlaying getNowPlaying;

  HomeScreenController(this.getNowPlaying);

  late final PagingController<int, HomeMovieItem> pagingController;
  int page = 1;
  int? totalPage;

  @override
  void onInit() {
    super.onInit();
    pagingController = PagingController<int, HomeMovieItem>(fetchPage: _fetchMovies, getNextPageKey: (state) => _getNextPageKey());
  }

  Future<List<HomeMovieItem>> _fetchMovies(int pageKey) async {
    try {
      final result = await getNowPlaying(page: pageKey);
      totalPage = result.first;
      return result.second;
    } catch (e) {
      logger.e('Error fetching movies: $e');
      return [];
    }
  }

  int? _getNextPageKey() {
    if (totalPage == null) {
      return 1;
    }

    if (page < totalPage!) {
      page++;
      return page;
    } else {
      return null;
    }
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}
