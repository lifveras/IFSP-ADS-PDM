import 'package:flutter/material.dart';
import 'package:forms_flutter/widget/login_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, dimensions) {
            final width = _getWidth(dimensions);
            final height = _getHeight(dimensions);

            return Center(
              child: SizedBox(
                width: width,
                height: height,
                child: LoginForm(),
              ),
            );
          },
        ),
      ),
    );
  }

  double _getWidth(dimensions) {
    return dimensions.maxWidth / 1.5;
  }

  double _getHeight(dimensions) {
    return dimensions.maxHeight / 1.5;
  }
}
