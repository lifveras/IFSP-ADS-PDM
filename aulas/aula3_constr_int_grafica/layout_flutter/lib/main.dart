import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: "Exemplo App",
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.info),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text("Item 1"),
              onTap: () {
                print("Item 3 Clicado");
              },
            ),
            ListTile(
              leading: const Icon(Icons.train),
              title: const Text("Item 3"),
              onTap: () {
                print("Item 3 Clicado");
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text("No"),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    //Instância e configura o AlertDialog
                    return AlertDialog(
                      title: const Text("Questão"),
                      content: const Text("Você gosta deste livro?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            print("Sim, eu gosto!");
                          },
                          child: const Text("Sim"),
                        ),
                        TextButton(
                          onPressed: () {
                            print("Não, eu não gosto!");
                          },
                          child: const Text("Não"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("Yes"),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.headphones),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
