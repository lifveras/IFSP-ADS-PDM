import 'package:flutter/material.dart';

import '../routers.dart';

class ListItemSea extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final void Function() onTap;

  ListItemSea({
    required this.name,
    required this.description,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // https://stackoverflow.com/questions/61227026/evaluation-of-this-constant-expression-throws-an-expression
    return ListTile(
      leading: Tab(
        icon: ClipOval(
          clipper: SeaClipper(),
          child: Image.network(image),
        ),
      ),
      title: Text(name),
      subtitle: Text(description),
      onTap: this.onTap,
    );
  }
}

class SeaClipper extends CustomClipper<Rect> {
  @override
  getClip(Size size) {
    return Rect.fromLTWH(0, 0, 45, 45);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
