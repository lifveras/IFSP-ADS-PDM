/**
 * Para executar cada exemplo, desconmente o MyApp correspondente a cada 
 * Widget.
 */
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(
    //  Definição de uma aplicação que utiliza Material Design
    //  Agrega os widgets e fornece valores de atributos
    // usualmente utilizados em uma aplicação com Material Design.
    MaterialApp(
      home: MyApp(),
    ),
  );
}

// Exemplo Widget - Column
// class MyApp extends StatelessWidget {
//   // build é um método obrigatório. Define como
//   // um widget será renderizado.
//   @override
//   Widget build(BuildContext context) {
//     // BuildContext trás informações
//     // sobre este widget em relação a árvore de Widget que está inserido.
//     // Representa uma coluna de Widgets
//     return Column(
//       //  Alinhamento no eixo principal (sentido vertical) da Column
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       // campo que recebe uma lista de widgets que serão
//       // organizados por Columns
//       children: const [
//         Text("Hello"),
//         Text("Flutter"),
//       ],
//     );
//   }
// }

// Exemplo Widget - Row
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       // Alinhamento no eixo principal (sentido horizontal) da Row
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: const [
//         Text("Hello"),
//         Text("Flutter"),
//         Text("!!!"),
//       ],
//     );
//   }
// }

// Exemplo Widget - ListView
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       // Se executar no navegador, reduzir as dimensões para a barra aparecer.
//       children: const [
//         Text("Hello"),
//         Text("Flutter"),
//         Text("!!!"),
//         Text("!!!"),
//         Text("!!!"),
//         Text("!!!"),
//         Text("!!!"),
//         Text("!!!"),
//         Text("!!!"),
//       ],
//     );
//   }
// }

// Exemplo Widget - ListView com itemBuilder
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final myList = List<int>.generate(100, (i) => i);
//     return ListView.builder(
//       itemCount: myList.length, // ajuda o ListView a estimar o tamanho da lista
//       itemBuilder: //Função com a lógica para criar cada item da Lista
//           // como há uma expressão Dart, precisamo utilizar {} na String Template
//           (context, index) => Text("${myList[index]}"),
//     );
//   }
// }

// Exemplo Widget - Container
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Alinha automaticamente no centro
//     return Align(
//       // Foi inserido dentro do Align para não ocupa toda a área de visualização
//       child: Container(
//         height: 80,
//         width: 400,
//         // Alinha a child dentro do Container
//         alignment: Alignment.center,
//         transform: Matrix4.rotationZ(-0.25),
//         color: Colors.blue,
//         // Diferente dos anteriores, Container possui um único Widget filho
//         child: const Text("Containers!"),
//       ),
//     );
//   }
// }

// Exemplo Widget - Stack e Positioned
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1º Widget
        Positioned(
          child: Container(
            width: 180,
            height: 180,
            alignment: Alignment.topLeft,
            //BoxDecoration permite definir cor, sombra, borda, etc
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: const Text("Green"),
          ),
        ),

        // 2º Widget
        Positioned(
          top: 60,
          left: 60,
          child: Container(
            width: 180,
            height: 180,
            alignment: Alignment.topLeft,
            //BoxDecoration permite definir cor, sombra, borda, etc
            decoration: const BoxDecoration(
              color: Color.fromRGBO(220, 0, 0, 1),
            ),
            child: const Text("Red"),
          ),
        ),

        // 3º Widget - Este Widget ficará no topo
        Positioned(
          top: 120,
          left: 120,
          child: Container(
            width: 180,
            height: 180,
            alignment: Alignment.topLeft,
            //BoxDecoration permite definir cor, sombra, borda, etc
            decoration: const BoxDecoration(
              color: Colors.purple,
            ),
            child: const Text("Purple"),
          ),
        ),
      ],
    );
  }
}
