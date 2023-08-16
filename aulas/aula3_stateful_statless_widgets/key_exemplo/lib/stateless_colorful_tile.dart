import 'package:flutter/material.dart';
import 'dart:math';

class StatelessColorfulTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lista de valores de níveis de vermelho
    List<int> shades = [100, 400, 500, 300];
    return Container(
      height: 200,
      width: 200,
      // Seleção aleatória de um nível de 
      // vermelho usando o índice da lista.  
      color: Colors.red[shades[Random().nextInt(4)]],
    );
  }
}
