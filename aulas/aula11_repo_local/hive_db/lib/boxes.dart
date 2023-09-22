import 'package:hive_db/pessoa.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Pessoa> getPessoas() => Hive.box<Pessoa>("pessoas_box");
  // static getConfig() => Hive.box("config");
  // static getCache() => Hive.box("cache");
}
