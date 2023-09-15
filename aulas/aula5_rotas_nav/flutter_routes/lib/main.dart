import 'package:flutter/material.dart';
import 'package:flutter_routes/routes.dart';

void main() {
  runApp(const RandomApp());
}

class RandomApp extends StatelessWidget {
  const RandomApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título do aplicativo
      onGenerateTitle: (context) => "Random App",
      // Rota inicial do aplicativo
      initialRoute: RouteGenerator.homePage,
      // Função que será invocada quando 
      //    solicitarmos uma página para navegação
      onGenerateRoute: RouteGenerator.generateRoute,
      // Remove o banner de Debug que fica no canto superior direito, 
      debugShowCheckedModeBanner: false,
    );
  }
}
