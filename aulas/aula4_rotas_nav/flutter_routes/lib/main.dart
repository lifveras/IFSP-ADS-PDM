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
      onGenerateTitle: (context) => "Random App",
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
