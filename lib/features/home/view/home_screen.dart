import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_test_app/config/theme/app_colors.dart';
import 'package:movie_test_app/config/theme/app_text_theme.dart';
import 'package:movie_test_app/core/constants/app_constants.dart';
import 'package:movie_test_app/domain/entities/home_movie_item.dart';
import 'package:movie_test_app/features/home/controller/home_screen_controller.dart';
import 'package:movie_test_app/features/movie_detail/controller/movie_detail_screen_controller.dart';
import 'package:movie_test_app/routes/app_navigator.dart';
import 'package:movie_test_app/routes/app_router.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('See Movies', style: AppTextTheme.headline),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              final navigator = Get.find<AppNavigator>();
              navigator.pushNamedWithResult(Routes.searchRoute);
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              final navigator = Get.find<AppNavigator>();
              navigator.pushNamedWithResult(Routes.favoritesRoute);
            },
          ),
        ],
      ),
      body: PagingListener(
        controller: controller.pagingController,
        builder:
            (context, state, fetchNextPage) => PagedGridView<int, HomeMovieItem>(
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
    );
  }

  void _handleOnTap(HomeMovieItem item) {
    final navigator = Get.find<AppNavigator>();
    navigator.pushNamedWithResult(Routes.movieDetailRoute, arguments: MovieScreenArguments(id: item.id ?? 0, title: item.title));
  }
}
