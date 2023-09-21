import 'package:flutter/material.dart';
import 'package:layoutbuilder_exemplo/widgets/grid_data.dart';
import 'package:layoutbuilder_exemplo/widgets/list_data.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'ListView Responsive',
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // LayoutBuilder vai retornar o Widget dependendo
      // das medidas de seu Widget pai.
      body: LayoutBuilder(
        builder: (context, sizes) {
          if (sizes.maxWidth < 500) {
            return const ListData();
          }
          return const GridData();
        },
      ),
    );
  }
}
