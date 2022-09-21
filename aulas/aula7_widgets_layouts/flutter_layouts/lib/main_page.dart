import 'package:flutter/material.dart';
import 'package:flutter_layouts/pages/nested_page.dart';
import 'package:flutter_layouts/pages/page_view_page.dart';
import 'package:flutter_layouts/pages/slivers_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<StatefulWidget> {
  int _selectedPage = 0;

  BottomNavigationBarItem _buildItem({IconData? icon, String? title}) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: Colors.blue,
      ),
      label: title,
      backgroundColor: Colors.yellow,
    );
  }

  _buildBody() {
    switch (_selectedPage) {
      case 0:
        return PageViewPage();
      case 1:
        return SliversPage();
      case 2:
        return NestedPage();
      default:
    }
  }

  void _onLayoutSelect(int value) {
    setState(() {
      _selectedPage = value;
    });
  }

  _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(icon: Icons.list, title: "PageView"),
        _buildItem(icon: Icons.rule, title: "Slivers"),
        _buildItem(icon: Icons.grid_3x3, title: "NestedList"),
        // _buildItem(icon: Icons.abc_outlined),
      ],
      onTap: (value) {
        print(value);
        _onLayoutSelect(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
