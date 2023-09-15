import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/routes.dart';
import 'package:provider_example/routes/todos_page.dart';

import 'model/todo_cache.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // documentação para o Provider
      //    https://pub.dev/packages/provider
      create: (_) => TodoCache(),
      // child: const TodosPage(),
      child: MaterialApp(
        initialRoute: RouteGenerator.homePage,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
