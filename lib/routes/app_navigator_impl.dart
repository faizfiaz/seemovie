import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_test_app/routes/app_navigator.dart';

class AppNavigatorImpl extends AppNavigator {
  @override
  void popUntil(String route) {
    Get.until((routeObj) => routeObj.settings.name == route);
  }

  @override
  void popWithResult({Object? result}) {
    if (Get.key.currentState?.canPop() ?? false) {
      Get.back(result: result);
    }
  }

  @override
  Future<Object?> pushNamedWithResult(String route, {Object? arguments}) async {
    return await Get.toNamed(route, arguments: arguments);
  }

  @override
  Future<Object?> pushReplacementNamedWithResult(String route, {Object? arguments}) async {
    return await Get.offNamed(route, arguments: arguments);
  }

  @override
  Future<Object?> pushNamedAndRemoveUntilWithResult(String newRouteName, bool Function(Route route) predicate, {Object? arguments}) async {
    return await Get.offNamedUntil(newRouteName, (route) => predicate(route), arguments: arguments);
  }

  @override
  String currentRoute() {
    return Get.currentRoute;
  }

  @override
  Object? currentArguments() {
    return Get.arguments;
  }

  @override
  BuildContext? getContext() {
    return Get.context;
  }
}
