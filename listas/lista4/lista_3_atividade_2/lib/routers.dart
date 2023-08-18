import 'package:flutter/material.dart';
import 'package:lista_3_atividade_1/routes/home_page.dart';
import 'package:lista_3_atividade_1/routes/info_sea.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String infoSea = "/infosea";

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case infoSea:
        return MaterialPageRoute(
          builder: (_) => InfoSea(),
        );
      default:
        throw FormatException("Rota não encontrada");
    }
  }
}
