import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final widthToAll = 160.0;
    final heightToAll = 160.0;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          Positioned(
            top: 40,
            left: 65,
            child: Container(
              width: widthToAll,
              height: heightToAll,
              color: Colors.red,
            ),
          ),
          Positioned(
            top: 60,
            left: 35,
            child: Container(
              width: widthToAll,
              height: heightToAll,
              color: Colors.yellow,
            ),
          ),
          Positioned(
            top: 110,
            left: 85,
            child: Container(
              width: widthToAll,
              height: heightToAll,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
