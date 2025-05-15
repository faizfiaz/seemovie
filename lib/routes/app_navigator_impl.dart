import 'package:flutter/material.dart';
import 'package:movie_test_app/routes/app_navigator.dart';

class AppNavigatorImpl extends AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey;

  AppNavigatorImpl(this.navigatorKey);

  @override
  void popUntil(String route) {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.popUntil(ModalRoute.withName(route));
    }
  }

  @override
  void popWithResult({Object? result}) {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.pop(result);
    }
  }

  @override
  Future<Object?> pushNamedWithResult(String route, {Object? arguments}) async {
    final result = await navigatorKey.currentState?.pushNamed(route, arguments: arguments);
    return result;
  }

  @override
  Future<Object?> pushReplacementNamedWithResult(String route, {Object? arguments}) async {
    final result = await navigatorKey.currentState?.pushReplacementNamed(route, arguments: arguments);
    return result;
  }

  @override
  Future<Object?> pushNamedAndRemoveUntilWithResult(String newRouteName, bool Function(Route p1) predicate, {Object? arguments}) async {
    final result = await navigatorKey.currentState?.pushNamedAndRemoveUntil(newRouteName, predicate, arguments: arguments);
    return result;
  }

  @override
  String currentRoute() {
    String? currentPath;
    navigatorKey.currentState?.popUntil((route) {
      currentPath = route.settings.name;
      return true;
    });
    return currentPath ?? '';
  }

  @override
  Object? currentArguments() {
    Object? currentArguments;
    navigatorKey.currentState?.popUntil((route) {
      currentArguments = route.settings.arguments;
      return true;
    });
    return currentArguments;
  }

  @override
  BuildContext? getContext() {
    return navigatorKey.currentContext;
  }
}
