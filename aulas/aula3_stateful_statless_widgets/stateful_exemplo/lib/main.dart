import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Estado do exemplo
  String _text = "";

  // Será chamado quando a tela for atualizada
  void _textChanged(String text) {
    // Atualiza o estado do widget com um novo texto
    // A tela será redesenhada após executar setState
    setState(() => _text = text);
  }

  @override
  Widget build(BuildContext context) {
    // Necessário para renderizar o Widget TextField
    return Material(
      child: Center(
        // Padding adiciona espaço entre as bordas e o conteúdo apresentado
        child: Padding(
          // EdgeInsets permite configurar o valor do padding. all() insere
          // padding em todas as direções
          padding: const EdgeInsets.all(200),
          child: Column(
            children: [
              // widget para campo de texto
              TextField(
                // quando o texto for inserido, _textChanged será invocado
                onChanged: (value) => _textChanged(value),
              ),
              Text(_text),
            ],
          ),
        ),
      ),
    );
  }
}
