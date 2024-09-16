// lib/app_routes.dart
import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/second_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String second = '/second';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case second:
        return MaterialPageRoute(
          builder: (context) => SecondPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
