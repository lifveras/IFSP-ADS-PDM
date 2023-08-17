import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Demo'),
      ),

      // Definição do Drawer no Scaffold
      drawer: Drawer(
        // Itens do Drawer são definidos em um ListView
        child: ListView(
          // Padding entre os elementos do ListView
          padding: EdgeInsets.zero,
          children: const [
            // Título que vai acima
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),

            // Início das opções do Drawer
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            // SizedBox adicionada pois o Widget pai está forçando o preenchimento
            // na horizontal do Card
            child: SizedBox(
              width: 300,
              // Definição do Card
              child: Card(
                margin: EdgeInsets.all(10),
                color: Colors.green[100],
                shadowColor: Colors.blueGrey,
                elevation: 10, // Quanto maior, mais sombra o card faz
                child: Column(
                  children: [
                    Text('Ingressos para o teatro'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          child: const Text('INGRESSO'),
                          onPressed: () {/* ... */},
                        ),
                        // Usado para preencher espaços para facilitar a construção de layout
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('AGUARDAR'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Divider que irá criar uma linha horizontal na tela
          const Divider(
            height: 20,
            thickness: 20, //espessura da linha
            indent: 20, //recuo da linha no início
            endIndent: 20, //recuo da linha no final
            color: Colors.black,
          ),

          // Elemento após o Divider
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Align(
              // Alinhamento do filho de Align
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Texto apos divisão',
                // Alinhamento do texto
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
