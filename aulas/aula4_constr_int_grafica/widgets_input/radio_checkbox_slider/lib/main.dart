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

// Enum criado para servir de opções para o Radio
enum Opcoes { opcao1, opcao2 }

class _MyAppState extends State<MyApp> {
  // Fará com que o Radio com esta opção esteja selecionado
  Opcoes? _opcao = Opcoes.opcao1;
  // Estado da checagem do checkbox
  bool _checkboxState = false;
  // Estado do switch
  bool _switchState = false;
  // Valor corrente do Slider
  double _sliderState = 20;

  // EventHandler para os Radios
  alteraOpcaoRadio(Opcoes escolhida) {
    setState(() {
      _opcao = escolhida;
      print(_opcao); // Veja o valor sendo alterado no conso
    });
  }

  // EventHandler para o Checkbox
  alternarChecagem(bool? value) {
    setState(() {
      _checkboxState = value!;
    });
  }

  // EventHandler para o Switch
  alternarSwitch(bool? value) {
    setState(() {
      _switchState = value!;
    });
  }

  // EventHandler para o Slider
  atualizaSlider(double? value) {
    setState(() {
      _sliderState = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          // Radio deve ter um ancestral Material()
          // ListTile deve ser utilizado em conjunto com Radio
          ListTile(
            title: const Text("Minha primeira opção"),
            // Radio é apenas o círculo que marca a opção
            leading: Radio(
              // Valor da primeira opção. Vem do enum Opções. Deve ser um Radio por opção
              value: Opcoes.opcao1,
              groupValue: _opcao, // Estado Do Widget alterado pelos Radios.
              onChanged: (value) =>
                  // Este método irá invocar setState()
                  alteraOpcaoRadio(value as Opcoes), //cast para Opções
            ),
          ),
          ListTile(
            title: const Text("Minha segunda opção"),
            leading: Radio(
              // Valor da segunda opção. Vem do enum Opções
              value: Opcoes.opcao2,
              groupValue: _opcao, // Valores considerados pelo radio.
              onChanged: (value) =>
                  alteraOpcaoRadio(value as Opcoes), //cast para Opções
            ),
          ),
          // ListTile para o Checkbox
          ListTile(
            title: Text("Texto do Checkbox"),
            leading: Checkbox(
              // Vai definir se o checkbox está marcado ou não
              value: _checkboxState,
              // EventHandler para alterar o state associado ao checkbox
              onChanged: alternarChecagem,
            ),
          ),
          // ListTile para o Checkbox
          ListTile(
            title: Text("Texto do Switch"),
            leading: Switch(
              // Cor do Switch quando estiver ativado
              activeColor: Colors.deepOrangeAccent[200],
              // Vai definir se o switch está marcado ou não
              value: _switchState,
              // EventHandler para alterar o state associado ao switch
              onChanged: alternarSwitch,
            ),
          ),
          Slider(
            max: 100, // Valor máximo do slider
            label: "valor: " + _sliderState.round().toString(), //texto indicando o valor do slider
            divisions: 10, // Número de pontos em que o Slider será quabrado
            value: _sliderState, // é um double
            onChanged: atualizaSlider,
          ),
        ],
      ),
    );
  }
}
