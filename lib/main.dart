import 'dart:async';

import 'package:dio_request_inspector/dio_request_inspector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/web.dart';
import 'package:movie_test_app/config/theme/app_theme.dart';
import 'package:movie_test_app/core/bindings/initial_binding.dart';
import 'package:movie_test_app/core/constants/app_constants.dart';
import 'package:movie_test_app/core/hive/app_hive.dart';
import 'package:movie_test_app/core/network/dio_provider.dart';
import 'package:movie_test_app/routes/app_router.dart';

var logger = Logger();

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await AppHive.init();

      if (AppConstants.isDebug) {
        runApp(DioRequestInspectorMain(inspector: inspector, child: App()));
      } else {
        runApp(App());
      }
    },
    (error, stackTrace) {
      // We can log the error here or send it to a remote server
      logger.e('Caught error: $error', stackTrace: stackTrace);
    },
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'See Movie',
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      getPages: AppRouter.routes,
      navigatorKey: Get.key,
      navigatorObservers: [DioRequestInspector.navigatorObserver],
      initialRoute: Routes.initialRoute,
      themeMode: ThemeMode.light,
      theme: appTheme,
    );
  }
}
