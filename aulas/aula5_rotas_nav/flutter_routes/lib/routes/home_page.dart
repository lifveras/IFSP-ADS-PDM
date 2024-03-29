import 'package:flutter/material.dart';
import 'package:flutter_routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Quando o botão é clicado, a página RandomPage será carregada
            Navigator.of(context).pushNamed(RouteGenerator.randomPage);
          },
          child: const Text("Random"),
        ),
      ),
    );
  }
}
