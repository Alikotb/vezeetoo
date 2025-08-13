import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vezeeto/core/di/depenedency_injection.dart';
import 'package:vezeeto/core/routing/routes.dart';
import 'package:vezeeto/features/home/ui/HomeScreen.dart';
import 'package:vezeeto/features/login/logic/login_cubit.dart';

import '../../features/login/loginScreen.dart';
import '../../features/onBoarding/onBoarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final args =
        settings.arguments; // this allows you to pass arguments to the route
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

    // Add more routes here as needed
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
