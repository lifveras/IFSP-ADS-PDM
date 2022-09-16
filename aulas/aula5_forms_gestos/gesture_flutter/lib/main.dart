import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Falar do Change Notififier Provider, que vem da lib provider
        body: ChangeNotifierProvider(
          create: (context) => SourceList(),
          child: const SwipeItems(),
        ),
      ),
    );
  }
}

class SourceList with ChangeNotifier {
  final _myList = List<String>.generate(10, (index) => "Number $index");

  List<String> get values => UnmodifiableListView(_myList);

  // Para que possamos avisar todos os Widgets dependentes dessa lista,
  // não podemos invocar removeAt direto do List. Criamos o removeItem
  // para invocar o notifyListenes()
  void removeItem(int index) {
    _myList.removeAt(index);
    notifyListeners();
  }
}

class SwipeItems extends StatelessWidget {
  const SwipeItems();
  @override
  Widget build(BuildContext context) {
    return Consumer<SourceList>(
      builder: (context, list, _) {
        return ListView.builder(
          itemCount: list.values.length,
          itemBuilder: (context, index) {
            var item = list.values[index];
            return Dismissible(
              // Fundalmental, pois é usado para identificar cada item, e é usado
              // internamente pelo Dismissible
              key: Key(item),
              // Widget que vai ser mostrado enquanto o item é movido para a direita
              background: Container(color: Colors.redAccent),
              // Callback que será executado quando a ação de deslizar for finalizada
              onDismissed: (direction) {
                list.removeItem(index);
              },
              direction: DismissDirection.startToEnd,
              child: ListTile(
                leading: const Icon(Icons.trending_flat),
                title: Text(item),
              ),
            );
          },
        );
      },
    );
  }
}
