import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task/bloc_observer.dart.dart';
import 'package:task/injection_controller.dart';

import 'core/routes/app_route.dart';
import 'core/routes/route.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute.onGenerateRoute,
      initialRoute: Routes.login,
    );
  }
}
