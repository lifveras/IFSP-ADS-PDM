import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:provider_example/model/todo.dart';

// ChangeNotifier fornece notificação de alterações aos seus ouvintes.
class TodoCache extends ChangeNotifier {
  var _index = -1;

  final List<Todo> _todos = [
    Todo("Item 1", "First to-do of the list"),
    Todo("Item 2", "Second to-do of the list"),
    Todo("Item 3", "Third to-do of the list")
  ];

  // Adiciona novos items na lista
  void addItem(String title, String descr) {
    _todos.add(Todo(title, descr));
    // Diz para o Flutter reconstruir as telas que utilizam esta lista,
    // pois ela foi modificada.
    notifyListeners();
  }

  // Recupera o index do último elemento selecionado.
  int get index => _index;

  // Atualiza o index
  set index(int value) {
    if ((value >= 0) && (value < _todos.length))
      _index = value;
    else
      _index = -1;
  }

  // Uma visão não modificável dos itens da lista de tarefas.
  // Assim, só poderemos alterar a lista se usarmos addItem()
  UnmodifiableListView<Todo> get list => UnmodifiableListView<Todo>(_todos);
}
