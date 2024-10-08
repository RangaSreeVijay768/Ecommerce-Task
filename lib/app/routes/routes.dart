import 'package:basic/app/ecommerce/screens/ecommerce_main_screen/ecommerce_main_screen.dart';
import 'package:basic/app/onboarding/screens/onboarding_welcome_screen/onboarding_welcome_screen.dart';
import 'package:basic/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return OnboardingWelcomeScreen();
      }),
]);
