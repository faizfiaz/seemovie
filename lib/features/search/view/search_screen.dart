import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_test_app/config/theme/app_colors.dart';
import 'package:movie_test_app/config/theme/app_text_theme.dart';
import 'package:movie_test_app/core/constants/app_constants.dart';
import 'package:movie_test_app/core/utils/debouncer.dart';
import 'package:movie_test_app/domain/entities/search_movie_item.dart';
import 'package:movie_test_app/features/movie_detail/controller/movie_detail_screen_controller.dart';
import 'package:movie_test_app/features/search/controller/search_screen_controller.dart';
import 'package:movie_test_app/routes/app_navigator.dart';
import 'package:movie_test_app/routes/app_router.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends GetView<SearchScreenController> {
  final Debouncer _debouncer = Debouncer(milliseconds: 500);
  final FocusNode _focusNode = FocusNode();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(title: const Text('Search Movies')),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  focusNode: _focusNode,
                  style: AppTextTheme.bodySmall,
                  onChanged: (value) {
                    _debouncer.run(() {
                      controller.setQuery(query: value);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search for movies',
                    border: OutlineInputBorder(),
                    hintStyle: AppTextTheme.bodySmall.copyWith(color: Colors.grey),
                  ),
                ),
              ),
            ),
            PagingListener(
              controller: controller.pagingController,
              builder:
                  (context, state, fetchNextPage) => PagedSliverGrid<int, SearchMovieItem>(
                    state: state,
                    fetchNextPage: fetchNextPage,
                    builderDelegate: PagedChildBuilderDelegate(
                      animateTransitions: true,
                      transitionDuration: const Duration(milliseconds: 300),
                      itemBuilder:
                          (context, item, index) => GestureDetector(
                            onTap: () => _handleOnTap(item),
                            child: CachedNetworkImage(
                              imageUrl: AppConstants.imageFullPath(item.posterPath ?? ''),
                              placeholder:
                                  (context, url) => SizedBox(
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade100,
                                      child: Container(color: Colors.grey, width: double.infinity, height: double.infinity),
                                    ),
                                  ),
                              errorWidget: (context, url, error) => const Icon(Icons.error, color: AppColors.error, size: 64),
                              fit: BoxFit.cover,
                            ),
                          ),
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.6),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleOnTap(SearchMovieItem item) {
    _focusNode.unfocus();
    final navigator = Get.find<AppNavigator>();
    navigator.pushNamedWithResult(Routes.movieDetailRoute, arguments: MovieScreenArguments(id: item.id ?? 0, title: item.title));
  }
}
