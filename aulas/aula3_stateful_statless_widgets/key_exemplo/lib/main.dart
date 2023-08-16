import 'package:flutter/material.dart';
import 'package:key_exemplo/stateless_colorful_tile.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // "late" Indica que será inicializado depois
  late List<Widget> tiles;

  @override
  // Podemos inicializar o estado do Widget aqui
  // É invocado uma única vez, quando o Widget é criado na árvore de Widgets.
  void initState() {
    super.initState();
    // Inicializa a lista definida como campo do Widget
    tiles = [
      StatelessColorfulTile(),
      StatelessColorfulTile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // Alinha os elementos no ínicio do eixo contrário ao do Row
      // O eixo contrário aqui é a Vertical, logo posicionará  no topo da tela
      crossAxisAlignment: CrossAxisAlignment.start,
      children: tiles, // atribui o estado do widget como filhos de Row
    );
  }
}
