import 'package:flutter/material.dart';
import 'package:provider_example/routes/form_page.dart';
import 'package:provider_example/routes/info_page.dart';
import 'package:provider_example/routes/todos_page.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String infoPage = "/info";
  static const String formPage = "/form";

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const TodosPage(),
        );
      case infoPage:
        return MaterialPageRoute(
          builder: (_) => const InfoPage(),
        );
      case formPage:
        return MaterialPageRoute(
          builder: (_) => const FormPage(),
        );
      default:
        throw FormatException("Rota não encontrada");
    }
  }
}
