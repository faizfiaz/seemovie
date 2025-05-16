import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_test_app/config/environment_config.dart';
import 'package:movie_test_app/features/home/home_binding.dart';
import 'package:movie_test_app/features/home/view/home_screen.dart';
import 'package:movie_test_app/features/movie_detail/movie_detail_binding.dart';
import 'package:movie_test_app/features/movie_detail/view/movie_detail_screen.dart';
import 'package:movie_test_app/features/search/search_binding.dart';
import 'package:movie_test_app/features/search/view/search_screen.dart';
import 'package:movie_test_app/features/splashscreen/splash_screen.dart';

mixin Routes {
  static const String initialRoute = '/';
  static const String mainRoute = '/home';
  static const String movieDetailRoute = '/movie_detail';
  static const String searchRoute = '/search';
}

class AppRouter {
  static final routes = <GetPage>[
    GetPage(name: Routes.initialRoute, page: () => SplashScreen.create()),
    GetPage(
      name: Routes.mainRoute,
      binding: HomeBinding(),
      page: () {
        if (EnvironmentConfig.envName != EnvName.production) {
          return const Banner(message: 'STAGING', textDirection: TextDirection.ltr, location: BannerLocation.topEnd, child: HomeScreen());
        }
        return const HomeScreen();
      },
    ),
    GetPage(name: Routes.movieDetailRoute, binding: MovieDetailBinding(), page: () => const MovieDetailScreen()),
    GetPage(name: Routes.searchRoute, binding: SearchBinding(), page: () => SearchScreen()),
  ];
}
