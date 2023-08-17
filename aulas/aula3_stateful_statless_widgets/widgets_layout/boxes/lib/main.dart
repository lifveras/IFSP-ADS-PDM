import 'package:flutter/material.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.all(50.0),
            color: Colors.amber[600],
            width: 200,
            height: 200,
            // Align permite definir o alinhamento do Widget filho
            // Se o widget pai tiver suas próprias regras de restrições (como
            // é o caso do Container), as restrições do filho serão ignoradas.
            // O Align resolve isso, pois a restrição do Container vai ser
            // aplicada sobre ele, e não mais sobre ConstrainedBox
            child: Align(
              // Ver mais em: https://api.flutter.dev/flutter/widgets/ConstrainedBox-class.html
              child: ConstrainedBox(
                // Restrição de tamanho estrito ao especificaco
                // Size(largura, altura)
                constraints: BoxConstraints.tight(const Size(50, 100)),
                // ColoredBox permite criar um filho sobre si após ser pintado
                // tela
                child: const ColoredBox(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 200,
          width: 100,
          color: Colors.blue,
          child: const FittedBox(
            // Tente outros valores como contain, cover, fitHeight, fitWidth.
            fit: BoxFit.fill,
            // Widget que desenha uma caixa
            child: Placeholder(),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: const RotatedBox(
            // RotatedBox gira 3 vezes o seu filho
            quarterTurns: 3,
            child: Text('Hello World!'),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: const SizedBox(
            width: 200.0,
            height: 300.0,
            child: Card(child: Text('Hello World!')),
          ),
        ),
      ],
    );
  }
}
