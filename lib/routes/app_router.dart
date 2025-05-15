import 'package:flutter/material.dart';
import 'package:movie_test_app/config/environment_config.dart';
import 'package:movie_test_app/features/home/view/home_screen.dart';
import 'package:movie_test_app/features/movie_detail/view/movie_detail_screen.dart';
import 'package:movie_test_app/features/splashscreen/splash_screen.dart';

mixin Routes {
  static const String initialRoute = '/';
  static const String mainRoute = '/home';
  static const String movieDetailRoute = '/movie_detail';
}

class AppRouter {
  static Map<String, Widget Function(BuildContext context)> generateRoute() {
    return {
      Routes.initialRoute: (context) => SplashScreen.create(),
      Routes.mainRoute: (context) {
        if (EnvironmentConfig.envName != EnvName.production) {
          return const Banner(message: 'STAGING', textDirection: TextDirection.ltr, location: BannerLocation.topEnd, child: HomeScreen());
        }
        return const HomeScreen();
      },
      Routes.movieDetailRoute: (context) => const MovieDetailScreen(),
    };
  }
}
