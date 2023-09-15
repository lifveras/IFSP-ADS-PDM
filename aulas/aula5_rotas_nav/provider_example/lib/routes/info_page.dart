import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/todo_cache.dart';

class InfoPage extends StatelessWidget {
  const InfoPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer<TodoCache>(
          builder: (context, cache, _) {
            final item = cache.list[cache.index];
            return Text("${item.description}");
          },
        ),
      ),
    );
  }
}
