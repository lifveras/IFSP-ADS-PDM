import 'package:flutter/material.dart';
import 'package:teste_flutter/http_widget.dart';
import 'package:teste_flutter/request_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const url = "https://jsonplaceholder.typicode.com/posts/10";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: HTTPWidget(RequestItem(
            url: url,
          )),
        ),
      ),
    );
  }
}
