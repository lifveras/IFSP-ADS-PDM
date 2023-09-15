import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/routes.dart';

import '../model/todo_cache.dart';

class TodosPage extends StatelessWidget {
  const TodosPage();

  void _open(BuildContext context) =>
      Navigator.of(context).pushNamed(RouteGenerator.infoPage);

  // static const _chars =
  //     'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  // static final Random _rnd = Random();

  // String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
  //     length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TodoCache>(
        builder: (context, cache, _) {
          return ListView.builder(
            // key: new Key(getRandomString(5)),
            itemCount: cache.list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${cache.list[index].title}"),
                onTap: () {
                  cache.index = index;
                  _open(context);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RouteGenerator.formPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoPageProvider extends StatelessWidget {
  const TodoPageProvider();

  @override
  Widget build(BuildContext context) {
    return Provider<TodoCache>(
      create: (_) => TodoCache(),
      // child: const TodosPage(),
      builder: (context, child) {
        return const TodosPage();
      },
    );
  }
}
