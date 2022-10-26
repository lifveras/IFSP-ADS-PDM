import 'package:flutter/material.dart';
import 'package:hive_db/pages/pessoa_page.dart';
import 'package:hive_db/pessoa.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //Inicializar o Hive no Flutter
  await Hive.initFlutter();
  // Registrar o Adapter
  Hive.registerAdapter(PessoaAdapter());
  // Carregar uma box
  await Hive.openBox<Pessoa>("pessoas_box");

  // // Carregar uma box
  // var box = Hive.box("pessoas_box");
  // // Adicionar um par <key,value>
  // box.put(
  //     "nome1",
  //     Pessoa()
  //       ..nome = "Nome Pessoa"
  //       ..idade = 30
  //       ..amigos = []);

  runApp(const HiveDbApp());
}

class HiveDbApp extends StatelessWidget {
  const HiveDbApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PessoaPage(),
    );
  }
}
