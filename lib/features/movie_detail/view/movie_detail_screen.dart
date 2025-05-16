import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_test_app/core/constants/app_constants.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/features/movie_detail/controller/movie_detail_screen_controller.dart';

part 'components/movie_content_info.dart';
part 'components/movie_detail_app_bar.dart';
part 'components/movie_detail_background.dart';
part 'components/movie_middle_content.dart';

class MovieDetailScreen extends GetView<MovieDetailScreenController> {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = controller.movie;

    return Scaffold(
      body: Obx(() {
        final detail = controller.detail.value;
        final isLoading = controller.isLoading.value;
        final error = controller.error.value;

        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (error != null) {
          return Center(child: Text(error));
        }

        if (detail == null) {
          return const Center(child: Text('No detail found.'));
        }

        return Stack(
          children: [
            _MovieDetailBackground(backdropPath: detail.backdropPath ?? movie.backdropPath),
            CustomScrollView(
              slivers: [
                _MovieDetailAppBar(backdropPath: detail.backdropPath ?? movie.backdropPath, title: detail.title ?? movie.title),
                _MovieMiddleContent(detail: detail),
                _MovieContentInfo(detail: detail),
              ],
            ),
          ],
        );
      }),
    );
  }
}
