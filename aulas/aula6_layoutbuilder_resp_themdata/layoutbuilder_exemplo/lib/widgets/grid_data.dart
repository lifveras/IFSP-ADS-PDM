import 'package:flutter/material.dart';

class GridData extends StatelessWidget {
  const GridData();
  @override
  Widget build(BuildContext context) {
    // Recupera as dimensões do Widget pai
    var size = MediaQuery.of(context).size;

    // Metade da altura do Widget pai
    final double itemHeight = size.height / 2;
    // Metade da largura do Widget pai
    final double itemWidth = size.width / 2;
    // Dica: Fica a seu critério definir a proporção que quiser

    return GridView.count(
      crossAxisCount: 3, // Divide o Grid em 3 colunas
      // Fator de escala do espaço de cada item 
      // do GridView.
      childAspectRatio: (itemWidth / itemHeight), 
      children: List.generate(
        100,
        (index) {
          return Center(
            child: ListTile(
              leading: const Icon(Icons.add_box),
              title: Text("Item $index"),
            ),
          );
        },
      ),
    );
  }
}
