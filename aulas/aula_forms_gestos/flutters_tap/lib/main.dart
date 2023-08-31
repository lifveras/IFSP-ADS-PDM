import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste com Gestos',
      home: _GestureDetectorExample(),
    );
  }
}

class _GestureDetectorExample extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplos Gestos Flutter'),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              // When the child is tapped, show a snackbar.
              onTap: () {
                const snackBar = SnackBar(
                  content: Text('Tap'),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              // The custom button
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text('Tap'),
              ),
            ),
            GestureDetector(
              // When the child is tapped, show a snackbar.
              onDoubleTap: () {
                const snackBar = SnackBar(
                  content: Text('Double Tap'),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              // The custom button
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text('Double Tap'),
              ),
            ),
            GestureDetector(
              // When the child is tapped, show a snackbar.
              onLongPress: () {
                const snackBar = SnackBar(
                  content: Text('Long press'),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              // The custom button
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text('Long Press'),
              ),
            ),
            GestureDetector(
              // When the child is tapped, show a snackbar.
              onVerticalDragStart: (details) {
                String text = details.toString();
                SnackBar snackBar = SnackBar(
                  content: Text(
                    "Vertical drag: ${text}",
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              onHorizontalDragStart: (details) {
                String text = details.toString();
                SnackBar snackBar = SnackBar(
                  content: Text("Horizontal drag: ${text}"),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              // The custom button
              child: Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.asset("assets/images/ifsp.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
