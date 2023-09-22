import 'package:flutter/material.dart';

import '../boxes.dart';
import '../widgets/nova_pessoa_dialog.dart';

class PessoaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PessoaPageState();
}

class _PessoaPageState extends State<PessoaPage> {
  @override
  void dispose() {
    Boxes.getPessoas().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: Boxes.getPessoas().length,
          itemBuilder: (context, index) {
            return Card(
              child: ExpansionTile(
                leading: const Icon(Icons.account_box),
                title: Text(
                  Boxes.getPessoas().getAt(index)!.nome,
                ),
                subtitle: Text(
                  "${Boxes.getPessoas().getAt(index)!.idade} anos de idade",
                ),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          icon: const Icon(Icons.delete),
                          label: const Text("deletar"),
                          onPressed: () {
                            Boxes.getPessoas().getAt(index)!.delete();
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => NovaPessoaDialog(),
          );
          setState(() {});
        },
      ),
    );
  }
}
