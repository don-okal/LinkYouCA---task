import 'package:flutter/material.dart';
import 'package:task/core/routes/route.dart';
import 'package:task/features/home/presentation/views/home_view.dart';
import 'package:task/features/login/presentation/views/login_view.dart';
import 'package:task/features/sign_up/presentation/views/sign_up_view.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );

      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}
