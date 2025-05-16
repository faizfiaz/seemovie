import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_test_app/domain/entities/search_movie_item.dart';
import 'package:movie_test_app/domain/usecases/search_movie.dart';
import 'package:movie_test_app/main.dart';

class SearchScreenController extends GetxController {
  final SearchMovie searchMovie;

  SearchScreenController(this.searchMovie);
  var movies = <SearchMovieItem>[].obs;

  late final PagingController<int, SearchMovieItem> pagingController;
  int page = 1;
  int? totalPage;
  String? query;

  @override
  void onInit() {
    super.onInit();
    pagingController = PagingController<int, SearchMovieItem>(fetchPage: fetchMovies, getNextPageKey: (state) => _getNextPageKey());
  }

  Future<List<SearchMovieItem>> fetchMovies(int pageKey) async {
    if (query == null) {
      return [];
    }

    try {
      final result = await searchMovie(page: pageKey, query: query!);
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

  void setQuery({required String query}) {
    this.query = query;
    page = 1;
    totalPage = null;
    pagingController.refresh();
  }
}
