import 'package:flutter/material.dart';

class ListData extends StatelessWidget {
  const ListData();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, id) {
          return ListTile(
            leading: const Icon(Icons.add_box),
            title: Text("Item $id"),
          );
        });
  }
}
