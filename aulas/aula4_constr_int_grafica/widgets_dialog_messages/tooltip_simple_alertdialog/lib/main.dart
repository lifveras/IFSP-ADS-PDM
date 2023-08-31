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
  _MyAppState createState() => _MyAppState();
}

// Opções para o SimpleDialog
enum Opcoes { opcao1, opcao2 }

class _MyAppState extends State<MyApp> {
  void _openAlertDialog() async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Título do AlertDialog'),
          // A documentação pede para utilizar este Widget
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Este é um AlertDialog.'),
                Text('Você gostaria de aprovar esta mensagem?'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Aprovar'),
              onPressed: () {
                // Volta à página, fechando o AlertDialog
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Não Aprovar'),
              onPressed: () {
                // Volta à página, fechando o AlertDialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _openSimpleDialog() async {
    var valor = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Título do SimpleDialog'),
          children: [
            SimpleDialogOption(
              // EventHandler para quando esta opção for selecionada
              onPressed: () {
                // Volta o foco para a página abaixo do Dialog
                Navigator.pop(context, Opcoes.opcao1.name.toString());
              },
              child: const Text('Opção 1'),
            ),
            SimpleDialogOption(
              onPressed: () {
                // Volta o foco para a página abaixo do Dialog
                Navigator.pop(context, Opcoes.opcao2.name.toString());
              },
              child: const Text('Opção 2'),
            ),
          ],
        );
      },
    );

    print("Opção escolhida: ${valor}");
  }

  Future<void> _openModalBottomSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Fechar BottomSheet'),
                  // Volta À tela que está embaixo do ModalBottomSheet
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Tooltip(
            message: 'Eu sou uma Tooltip',
            child: Text('Passe o mouse sobre para mostrar o Tooltip.'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              // Callback que invoca o SimpleDialog
              onPressed: _openAlertDialog,
              child: Text("Clique para abrir o AlertDialog"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              // Callback que invoca o SimpleDialog
              onPressed: _openSimpleDialog,
              child: Text("Clique para abrir o SimpleDialog"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              // Callback que invoca o SimpleDialog
              onPressed: _openModalBottomSheet,
              child: Text("Clique para abrir o ModalBottomSheet"),
            ),
          ),
        ],
      ),
    );
  }
}
