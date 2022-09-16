import 'package:atividade_2/widgets/item_task.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(TaskListApp());
}

class TaskListApp extends StatelessWidget {
  final List<DateTime> data = [
    DateTime(2022, 1, 1),
    DateTime(2022, 2, 1),
    DateTime(2022, 3, 1),
    DateTime(2022, 4, 1),
    DateTime(2022, 5, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Task List App"),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(30, 30, 0, 0),
              child: ElevatedButton(
                onPressed: () => {},
                child: Text("View Completed Tasks"),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(30, 30, 0, 0),
              child: Text("Você têm 5 tarefas incompletas"),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ItemTask(data[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
