import 'package:movie_test_app/config/environment_config.dart';

mixin AppConstants {
  static const String proxyDevOptionsId = 'PROXY_ID';
  static const String httpCache = 'HTTP_CACHE';
  static String apiUrl = EnvironmentConfig.apiUrl;
  static String apiKey = EnvironmentConfig.apiKey;
  static String readToken = EnvironmentConfig.readToken;

  static bool get isDebug => EnvironmentConfig.envName == EnvName.staging;
  static bool get isProduction => EnvironmentConfig.envName == EnvName.production;

  static const String imageW342 = 'w342';
  static const String imageW500 = 'w500';
  static const String imageW780 = 'w780';

  static String imageFullPath(String value, {String size = imageW500}) {
    return 'https://image.tmdb.org/t/p/$size$value';
  }
}
