import 'package:flutter/material.dart';
import 'package:flutter_routes/routes/home_page.dart';
import 'package:flutter_routes/routes/random_page.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String randomPage = "/random";

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case randomPage:
        return MaterialPageRoute(
          builder: (_) => const RandomPage(),
        );
      default:
        throw FormatException("Rota não encontrada");
    }
  }
}
