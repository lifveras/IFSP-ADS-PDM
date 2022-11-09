// Esta classe é ponto central de onde o dado irá fluir para o BLOC
import 'package:bloco_exemplo/models/item_model.dart';
import 'package:bloco_exemplo/resources/movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}
