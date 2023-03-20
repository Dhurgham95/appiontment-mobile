import 'package:flutter/material.dart';
import 'package:mobile_appiontment/pages/login_page.dart';
import 'package:mobile_appiontment/pages/register_page.dart';
import 'package:mobile_appiontment/pages/splash_screen.dart';
import 'package:mobile_appiontment/pages/test_page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case TestPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TestPage(),
      );

    case SplashPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SplashPage(),
      );

    case RegisterPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RegisterPage(),
      );

    case LoginPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginPage(),
      );
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("screen does not Exist"),
                ),
              ));
  }
}
