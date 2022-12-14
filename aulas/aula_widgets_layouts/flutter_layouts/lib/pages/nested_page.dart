import 'package:flutter/material.dart';

class NestedPage extends StatelessWidget {
  NestedPage({Key? key}) : super(key: key);

  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 16,
          itemBuilder: (BuildContext content, int index) {
            return _buildHorizontalList(parentIndex: index);
          },
        ),
      ),
    );
  }

  _buildHorizontalList({int? parentIndex}) {
    var colors = [
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.red,
      Colors.orange
    ];
    double height = 136.0;

    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (BuildContext content, int index) {
          return _buildItem(
            index: index + 1,
            color: colors[(parentIndex! + index) % colors.length],
            parentSize: height,
          );
        },
      ),
    );
  }

  Widget _buildItem({int? index, Color? color, double? parentSize}) {
    double edgeSize = 8.0;
    double itemSize = parentSize! - edgeSize * 2.0;
    return Container(
      padding: EdgeInsets.all(edgeSize),
      child: SizedBox(
        width: itemSize,
        height: itemSize,
        child: Container(
          alignment: AlignmentDirectional.center,
          color: color,
          child: Text(
            '$index',
            style: const TextStyle(fontSize: 72.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
