import 'package:flutter/material.dart';

class AppNavigation {
  static void navigateTo({
    required BuildContext context,
    required String routeName,
    Object? arguments,
  }) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void navigateAndReplacement({
    required BuildContext context,
    required String newRoute,
    Object? arguments,
  }) {
    Navigator.pushReplacementNamed(context, newRoute, arguments: arguments);
  }

  static Future<Object?> navigateAndRemoveUntil({
    required BuildContext context,
    required String newRoute,
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      newRoute,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
