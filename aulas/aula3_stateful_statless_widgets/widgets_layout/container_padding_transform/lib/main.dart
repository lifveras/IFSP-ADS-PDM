import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            // Margem é o espaço da borda de um Widget para outro
            margin: const EdgeInsets.all(50.0),
            color: Colors.amber[600],
            width: 200, // Largura do Cont]ainer
            height: 200, // Altura do Containe
          ),
        ),
        // Exemplo de uso do padding
        Padding(
          // 120px adicionados em todas as direções
          padding: EdgeInsets.all(120),
          child: Text("Exemplo Padding"),
        ),
        Transform(
          alignment: Alignment.topRight,
          // Skew torce o Widget no eixo y ...
          // e depois rationa 0,26 rad no sentido anti-horário ...
          // Veja mais transformações em https://api.flutter.dev/flutter/widgets/Transform-class.html
          transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12),
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue,
            child: Text('Os melhores descontos aqui!'),
          ),
        )
      ],
    );
  }
}
