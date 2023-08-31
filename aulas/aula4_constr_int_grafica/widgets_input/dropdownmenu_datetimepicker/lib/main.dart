import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List _listaDeItens = [];
  String _dropdownValue = "Item 1"; // Item inicialmente selecionado
  DateTime dataSelecionada = DateTime.now();
  TimeOfDay _horaSelecionada = TimeOfDay.now(); // Hora inicial do DatePicker

  @override
  void initState() {
    super.initState();
    // Gera 10 Itens no padrão Item 1, Item 2, Item 3 ...
    _listaDeItens = List.generate(10, (index) => "Item ${index + 1}");
  }

  // Chamado quando o usuário seleciona um item
  selectItemFromDropdown(dynamic value) {
    setState(() {
      _dropdownValue = value!;
    });
  }

  // DatePicker é um modal, que é inflada de fora da árvore do Widget
  // Sendo assim, coletar uma data é uma operação assíncrona,
  // por isso o Future<void>
  Future<void> _selectDate(BuildContext context) async {
    // Mostra o DatePicker e espera por uma data selecionada
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dataSelecionada,
      firstDate: DateTime(2023, 8),
      lastDate: DateTime(2101),
    );

    // Se uma data for selecionada, atualiza o estado
    if (picked != null && picked != dataSelecionada) {
      setState(() {
        dataSelecionada = picked;
      });
    }
  }

  // TimePicker é um modal, que é inflada de fora da árvore do Widget
  // Sendo assim, coletar uma hora é uma operação assíncrona,
  // por isso o Future<void>
  // BuildContext é necessário para o showTimePicker
  Future<void> _selectHour(BuildContext context) async {
    // Mostra o DatePicker e espera por uma data selecionada
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        );

    // Se uma data for selecionada, atualiza o estado
    if (picked != null && picked != _horaSelecionada) {
      setState(() {
        _horaSelecionada = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          // <T> Especifica o tipo de objeto tratado pelo Dropdown
          DropdownButton<String>(
            // Variável que será atualizada ao selecionar item
            value: _dropdownValue,
            // A lista é mapeada para uma lista de DropdownMenuItem<String>
            items: _listaDeItens.map<DropdownMenuItem<String>>(
              (item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              },
            ).toList(), // map retorna um Iterable, mas DropdownButton.items recebe uma List.
            onChanged:
                selectItemFromDropdown, // EventHandler ao mudar o dropdown
          ),

          // Este botão vai invocar o DataPicker
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: ElevatedButton(
              // Invoca o DatePicker.context é importante para que o widget possa
              // ser desenhado na tela
              onPressed: () => _selectDate(context),
              child: const Text('Selecione uma data'),
            ),
          ),

          // Este botão vai invocar o DataPicker
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: ElevatedButton(
              // Invoca o DatePicker.context é importante para que o widget possa
              // ser desenhado na tela
              onPressed: () => _selectHour(context),
              child: const Text('Selecione uma hora'),
            ),
          ),
        ],
      ),
    );
  }
}
