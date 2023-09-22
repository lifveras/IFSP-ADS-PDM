import 'dart:convert';
import 'package:bloco_exemplo/models/item_model.dart';
import 'package:http/http.dart' show Client;

// Irá fazer a requisição à API e criar um ItemModel preenchido.
class MovieApiProvider {
  Client client = Client();
  final _apiKey = '7509fbd8e13a77993491b6a04ad9c530';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    Uri url =
        Uri.parse("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    final response = await client.get(url);
    print(response.body.toString());
    if (response.statusCode == 200) {
      // Se a chamada ao servidor for bem sucedida, faz o parse para JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // Se a chamada não for bem sucedida, lança um erro
      throw Exception('Failed to load post');
    }
  }
}
