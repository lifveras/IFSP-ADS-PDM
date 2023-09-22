import 'package:flutter/material.dart';
import 'package:hive_db/boxes.dart';

import '../pessoa.dart';

class NovaPessoaDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NovaPessoaDialog();
}

class _NovaPessoaDialog extends State<NovaPessoaDialog> {
  final formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    idadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Adiciona uma nova pessoa"),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 8,
              ),
              buildNomeField(),
              const SizedBox(
                height: 8,
              ),
              buildIdadeField(),
            ],
          ),
        ),
      ),
      actions: [
        buildCancelButton(context),
        buildAddButton(context),
      ],
    );
  }

  buildNomeField() {
    return TextFormField(
      controller: nomeController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: "Entre com seu nome"),
      validator: (nome) =>
          nome == null || nome.isEmpty ? "Entre com um nome" : null,
    );
  }

  buildIdadeField() {
    return TextFormField(
      controller: idadeController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Entre com a sua idade",
      ),
      validator: (idade) => idade == null || double.tryParse(idade) == null
          ? "Entre com um número válido"
          : null,
    );
  }

  Widget buildCancelButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("Cancel"),
    );
  }

  Widget buildAddButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        final isValid = formKey.currentState!.validate();

        if (isValid) {
          final nome = nomeController.text;
          final idade = double.tryParse(idadeController.text);

          final pessoa = Pessoa()
            ..nome = nome
            ..idade = idade!
            ..amigos = [];

          Boxes.getPessoas().put(pessoa.nome, pessoa);
          Navigator.of(context).pop();
        }
      },
      child: const Text("Salvar"),
    );
  }
}
