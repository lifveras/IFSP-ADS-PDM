import 'package:flutter/material.dart';
import 'package:teste_flutter/request_item.dart';

import 'item.dart';

class HTTPWidget extends StatefulWidget {
  final HTTPRequest<Item> _request;
  const HTTPWidget(this._request);

  @override
  State<StatefulWidget> createState() => _HTTPWidgetState();
}

class _HTTPWidgetState extends State<HTTPWidget> {
  late Future<Item> futureItem;

  @override
  void initState() {
    super.initState();
    futureItem = widget._request.execute();
  }

  @override
  Widget build(Object context) {
    return FutureBuilder(
      future: futureItem,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Erro no GET de dados da API"),
          );
        }

        if (snapshot.hasData) {
          return Center(
            child: Text(
              // .data trará o Item retornado pela Future
              snapshot.data.toString(),
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
