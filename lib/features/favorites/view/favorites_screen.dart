import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_test_app/core/constants/app_constants.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/features/favorites/controller/favorites_screen_controller.dart';
import 'package:movie_test_app/features/movie_detail/controller/movie_detail_screen_controller.dart';
import 'package:movie_test_app/routes/app_navigator.dart';
import 'package:movie_test_app/routes/app_router.dart';

class FavoritesScreen extends GetView<FavoritesScreenController> {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Obx(() {
        final movies = controller.movies;
        if (movies.isEmpty) {
          return const Center(child: Text('No favorite movies found.'));
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return GestureDetector(
              onTap: () => _handleOnTap(movie),
              child: CachedNetworkImage(
                imageUrl: AppConstants.imageFullPath(movie.posterPath ?? ''),
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                height: 200,
              ),
            );
          },
        );
      }),
    );
  }

  Future<void> _handleOnTap(DetailMovie movie) async {
    final navigator = Get.find<AppNavigator>();
    await navigator.pushNamedWithResult(
      Routes.movieDetailRoute,
      arguments: MovieScreenArguments(id: movie.id ?? 0, title: movie.title ?? '', backdropPath: movie.backdropPath ?? ''),
    );
    controller.fetchFavoriteMovies();
  }
}
