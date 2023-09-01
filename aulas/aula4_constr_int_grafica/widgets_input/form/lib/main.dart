import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
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
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Form(
          // a key é importante para referência ao form posteriormente
          key: _formKey,
          child: Center(
            child: SizedBox(
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text("Email: "),
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
                      const Text("Nome: "),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          onSaved: (newValue) => 
                            setState(() {
                              _nome = newValue!;
                            }),
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
                      child: const Text("Enviar"),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
