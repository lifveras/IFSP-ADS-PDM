import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      title: "ThemeData Example",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
        ),

        // Define os temas de todos os textos do aplicativo
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.red),
          displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.normal),
          // displaySmall: GoogleFonts.nunito(),
        ),
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // GlobalKey, uma chave exclusiva em todo o aplicativo.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = "";
  String _nome = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ThemeExample")),
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Form(
          // a key é importante para referência ao form posteriormente
          key: _formKey,
          child: Center(
            child: SizedBox(
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text("Email: "),
                      SizedBox(
                        width: 300,
                        // TextFormField, um widget conveniente que envolve um widget TextField em um FormField.
                        child: TextFormField(
                          onSaved: (newValue) => _email = newValue!,
                          decoration: const InputDecoration(
                            hintText: "Entre com seu email",
                          ),
                          // Irá validar conteúdo do TextFormField
                          validator: (String? value) {
                            if (value == null || value.isEmpty)
                              return 'Por favor insira algum texto';
                            else if (!value.contains("@"))
                              return 'Este não é um email válido';
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Nome: ",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          onSaved: (newValue) => _nome = newValue!,
                          decoration: const InputDecoration(
                            hintText: "Entre com seu nome",
                          ),
                          // Irá validar conteúdo do TextFormField
                          validator: (String? value) {
                            if (value == null || value.isEmpty)
                              return 'Por favor insira algum texto';
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.00),
                    child: ElevatedButton(
                      child: Text("Enviar"),
                      onPressed: () {
                        // Validate irá retornar true se o form for válido
                        // False caso contrário
                        if (_formKey.currentState!.validate()) {
                          // Processa os dados do form
                          _formKey.currentState!.save();
                          print("EMAIL: $_email | NOME: $_nome");
                        }
                      },
                    ),
                  ),
                  Theme(
                    data: ThemeData.from(
                      colorScheme: ColorScheme.fromSwatch(
                        primarySwatch: Colors.amber,
                      ),
                    ),
                    child: Builder(
                      builder: (context) {
                        return Container(
                          width: 100,
                          height: 100,
                          color: Theme.of(context).colorScheme.primary,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (() {}),
      ),
    );
  }
}
