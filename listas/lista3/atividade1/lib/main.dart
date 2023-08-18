import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyForm(),
    ),
  );
}

class MyForm extends StatefulWidget {
  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  late Map<String, String> _formData;
  late List<Map<String, String>> cadastros;

  @override
  void initState() {
    super.initState();
    _formData = {
      "nome": "",
      "email": "",
    };

    cadastros = [];
  }

  void _fieldChanged(String key, String value) {
    setState(() {
      _formData[key] = value;
    });
  }

  void _saveDataOnList() {
    if (_formData["nome"]!.isNotEmpty && _formData["email"]!.isNotEmpty) {
      setState(() {
        print(_formData);
        cadastros.add(_formData);
        _formData = {
          "nome": "",
          "email": "",
        };
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: SizedBox(
          width: 800,
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 200,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Nome: ",
                            style: TextStyle(
                              // Deixa o texto em negrito
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Necessário definir um Container para restringir
                          // o tamanho do TextField.
                          // Caso contrário o mesmo terá tamanho infinity, e o
                          // flutter não irá desenhar o Widget.
                          // Isso ocorro deivod aos Widgets Row e Column, que
                          // possuem largura e altura inifitas, respectivamente.
                          Container(
                            width: 150,
                            child: TextField(
                              onChanged: (value) =>
                                  _fieldChanged("nome", value),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Email: ",
                            style: TextStyle(
                              // Deixa o texto em negrito
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Mesmo caso do TextField anterior
                          Container(
                            width: 150,
                            child: TextField(
                              onChanged: (value) =>
                                  _fieldChanged("email", value),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                          onPressed: _saveDataOnList,
                          child: Text("Inserir"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Lista dos cadastros registrados
              ListView.builder(
                // IMPORTANTE! Especialmente quando temos um Widget que cria
                // scroll dentro de outro que também cria scroll. Neste caso,
                // temos um ListView dentro de uma Column.
                // shrinkWrap: true restringe o tamanho do ListView à parte
                // visível da tela.
                shrinkWrap: true,
                itemCount: cadastros.length,
                itemBuilder: (context, index) {
                  // Se tiver problemas de renderização do Card, lembra-se de
                  // adicioná=lo a alguma box ou container para restringir seu
                  // tamanho. Isso occore pois o Card está dentro de uma Column,
                  // que possui altura infinita, não permitindo o Widget filho
                  // definir um tamanho para si.
                  return SizedBox(
                    height: 50,
                    child: Card(
                      elevation: 5,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Nome: ",
                                style: TextStyle(
                                  // Deixa o texto em negrito
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                  // A Exclamação verifica antes se o valor da chave
                                  // "nome" não é nulo
                                  (cadastros[index]["nome"])!),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Email: ",
                                style: TextStyle(
                                  // Deixa o texto em negrito
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                  // A Exclamação ao final da expressão verifica
                                  // antes se o valor da chave "email" não é nulo.
                                  (cadastros[index]["email"])!),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
