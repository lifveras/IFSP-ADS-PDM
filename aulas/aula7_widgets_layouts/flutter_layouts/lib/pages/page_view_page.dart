import 'package:flutter/material.dart';

class PageViewPage extends StatelessWidget {
  PageViewPage({Key? key}) : super(key: key);

  final controllerPageView = PageController(
    initialPage: 0,
  );

  _buildPage({int? index, Color? color}) {
    return Container(
      alignment: AlignmentDirectional.center,
      color: color,
      child: Text(
        '$index',
        style: const TextStyle(fontSize: 132.0, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {},
        child: PageView(
          controller: controllerPageView,
          children: [
            _buildPage(index: 1, color: Colors.green),
            _buildPage(index: 2, color: Colors.blue),
            _buildPage(index: 3, color: Colors.indigo),
            _buildPage(index: 4, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
