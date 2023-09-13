import 'package:animated_fishing/pages/start_page.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String startPage = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startPage:
        return MaterialPageRoute(
          builder: (context) => const StartPage(),
        );

      default:
        throw const FormatException('Route not found! Check routes again!');
    }
  }
}
