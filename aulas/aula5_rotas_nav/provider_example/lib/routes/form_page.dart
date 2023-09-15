import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/todo.dart';
import 'package:provider_example/model/todo_cache.dart';

class FormPage extends StatefulWidget {
  const FormPage();

  @override
  State<StatefulWidget> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  // Os controllers facilitam capturar dados dos campos dos formulários
  final _titleController = TextEditingController();
  // Os controllers facilitam capturar dados dos campos dos formulários
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<TodoCache>(
        builder: (context, value, child) {
          return Center(
            child: Consumer<TodoCache>(
              builder: (context, cache, _) {
                return Form(
                  // GlobalKey do formulário
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        // Vincula o controller ao TextFormField
                        controller: _titleController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.title),
                          hintText: 'Adicione um título para a sua tarefa',
                          labelText: 'Título *',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Por favor entre com algum texto';
                          return null;
                        },
                      ),
                      TextFormField(
                        // Vincula o controller ao TextFormField
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.description),
                          hintText: 'Descreva a sua tarefa.',
                          labelText: 'Descrição *',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Por favor entre com algum texto';
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // O campo .text recupera o valor digitado nos TextFormFields
                              final title = _titleController.text;
                              final description = _descriptionController.text;
                              // Os valores digitados serão adicionados ao cache
                              cache.addItem(title, description);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('$title salvo com sucesso!'),
                                ),
                              );
                            }
                          },
                          child: const Text('Enviar'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
