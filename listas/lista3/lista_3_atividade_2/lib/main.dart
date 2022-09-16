import 'package:flutter/material.dart';
import 'package:lista_3_atividade_1/model/sea_cache.dart';
import 'package:lista_3_atividade_1/routers.dart';
import 'package:lista_3_atividade_1/routes/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const SeasApp());
}

class SeasApp extends StatelessWidget {
  const SeasApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<SeaCache>(
      create: (_) => SeaCache(),
      child: const MaterialApp(
        title: "Seas App",
        initialRoute: RouteGenerator.homePage,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
