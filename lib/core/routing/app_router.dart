import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vezeeto/core/routing/routes.dart';

import '../../features/login/loginScreen.dart';
import '../../features/onBoarding/onBoarding_screen.dart';

class AppRouter{
  Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;// this allows you to pass arguments to the route
    switch (settings.name) {
      case Routes.onBoarding:
        return CupertinoPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.login:
        return CupertinoPageRoute(
          builder: (_) => const LoginScreen(),
        );
      // Add more routes here as needed
      default:
        return MaterialPageRoute(
          builder:(_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}