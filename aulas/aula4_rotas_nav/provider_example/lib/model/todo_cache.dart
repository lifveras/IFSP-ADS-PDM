import 'dart:collection';

import 'package:provider_example/model/todo.dart';

class TodoCache {
  var _index = -1;

  final List<Todo> _todos = [
    Todo("Item 1", "First to-do of the list"),
    Todo("Item 2", "Second to-do of the list"),
    Todo("Item 3", "Thrid to-do of the list")
  ];

  void addItem(String title, String descr) {
    _todos.add(Todo(title, descr));
  }

  int get index => _index;

  set index(int value) {
    if ((value >= 0) && (value < _todos.length)) {
      _index = value;
    } else {
      _index = -1;
    }
  }

  UnmodifiableListView<Todo> get list => UnmodifiableListView<Todo>(_todos);
}
