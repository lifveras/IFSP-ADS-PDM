import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("Hello", textDirection: TextDirection.ltr),
        Text("Flutter", textDirection: TextDirection.ltr)
      ]
    );
  }
}
