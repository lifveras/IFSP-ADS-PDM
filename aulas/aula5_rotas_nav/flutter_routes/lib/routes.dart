import 'package:flutter/material.dart';
import 'package:flutter_routes/routes/home_page.dart';
import 'package:flutter_routes/routes/random_page.dart';

class RouteGenerator {
  // caminho para a página raiz
  static const String homePage = '/';
  // caminho para a página "random"
  static const String randomPage = "/random";

  // Torna o construtor privado. Ou Seja, ninguém, além da própria classe
  // pode instanciar um objeto do tipo RouteGenerator.
  RouteGenerator._() {}

  // Método estático que gera uma nova rota solicitada
  // O MaterialApp saberá utilizar este método.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // settings trará o nome da página solicitada.
    switch (settings.name) {
      case homePage:
        // Uma página do MaterialApp
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case randomPage:
        // Uma página do MaterialApp
        return MaterialPageRoute(
          builder: (_) => const RandomPage(),
        );
      default:
        throw FormatException("Rota não encontrada");
    }
  }
}
