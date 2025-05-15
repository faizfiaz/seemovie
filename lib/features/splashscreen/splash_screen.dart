import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_test_app/routes/app_navigator.dart';
import 'package:movie_test_app/routes/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static SplashScreen create() => const SplashScreen();

  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: Center(child: Text('SEEMOVIEwelcome')));
  }

  Future<void> startTimer() async {
    const duration = Duration(seconds: 1);
    Timer(duration, checkNextPage);
  }

  Future<void> checkNextPage() async {
    final navigator = Get.find<AppNavigator>();
    navigator.pushReplacementNamedWithResult(Routes.mainRoute);
  }
}
