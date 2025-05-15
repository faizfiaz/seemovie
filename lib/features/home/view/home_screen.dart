import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_test_app/core/constants/app_constants.dart';
import 'package:movie_test_app/domain/entities/movie_item.dart';
import 'package:movie_test_app/features/home/controller/home_controller.dart';
import 'package:movie_test_app/routes/app_navigator.dart';
import 'package:movie_test_app/routes/app_router.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Now Playing')),
      body: PagingListener(
        controller: controller.pagingController,
        builder:
            (context, state, fetchNextPage) => PagedGridView<int, MovieItem>(
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate(
                animateTransitions: true,
                transitionDuration: const Duration(milliseconds: 300),
                itemBuilder:
                    (context, item, index) => GestureDetector(
                      onTap: () {
                        final navigator = Get.find<AppNavigator>();
                        navigator.pushNamedWithResult(Routes.movieDetailRoute, arguments: item);
                      },
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
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.6),
            ),
      ),
    );
  }
}
