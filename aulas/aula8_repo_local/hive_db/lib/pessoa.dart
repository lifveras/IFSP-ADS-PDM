import 'package:hive/hive.dart';

part 'pessoa.g.dart';

@HiveType(typeId: 1)
class Pessoa extends HiveObject {
  @HiveField(0)
  late String nome;
  @HiveField(1)
  late double idade;
  @HiveField(2)
  late List<Pessoa> amigos;
}
