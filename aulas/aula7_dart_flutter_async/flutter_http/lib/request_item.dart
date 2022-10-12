import 'dart:convert';

import 'item.dart';
import 'package:http/http.dart' as http;

abstract class HTTPRequest<T> {
  Future<T> execute();
}

class RequestItem implements HTTPRequest<Item> {
  final String url;
  const RequestItem({required this.url});

  @override
  Future<Item> execute() async {
    // http://domain/path/1
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw http.ClientException("Erro HTTP no cliente!");
    }
    await Future.delayed(Duration(seconds: 5));
    return _parseJson(response.body);
  }

  Item _parseJson(String bodyResponse) =>
      Item.fromJson(jsonDecode(bodyResponse));
}
