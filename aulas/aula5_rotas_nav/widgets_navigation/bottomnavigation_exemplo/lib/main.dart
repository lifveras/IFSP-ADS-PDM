import 'package:flutter/material.dart';

/**
 * Fonte do exemplo: https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
 * Flutter code sample for [BottomNavigationBar].
 */

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  // Armazena a tela selecionada em um dado momento pelo BottomNavigationBar
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // Lista de telas(Widgets) que poderão ser selecionadas com o BottomNavigationBar. 
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  // Atualiza o Widget selecionado pelo BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // A lista abaixo define os icones que irão ativar cada Widget
        // a ser apresentado pelo BottomNavigationBar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem( // corresponde ao item de índice 0
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem( // corresponde ao item de índice 1
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem( // corresponde ao item de índice 2
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped, // callback para quando um ícone for pressionado
      ),
    );
  }
}
