import 'dart:collection';

import 'package:lista_3_atividade_1/model/sea.dart';

class SeaCache {
  var _index = -1;

  final List<Sea> _todos = [
    Sea(
        "Mar Morto",
        "Tem esse nome devido à quase ausência de vida em suas águas",
        "http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQ4dodIImH6Q2y4dvmuwXlvcEWGRPewQ_DmhacEVjcIiOME5SHMinNgh6U60zOH1mM5"),
    Sea(
        "Mar Báltico",
        "Comunica com o mar do Norte, através do Escagerraque e Categate, e através dos estreitos de Öresund",
        "http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQ4dodIImH6Q2y4dvmuwXlvcEWGRPewQ_DmhacEVjcIiOME5SHMinNgh6U60zOH1mM5"),
    Sea(
        "Mar Egeu",
        "É um mar interior da bacia do mar Mediterrâneo situado entre a Europa e a Ásia. ",
        "http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQ4dodIImH6Q2y4dvmuwXlvcEWGRPewQ_DmhacEVjcIiOME5SHMinNgh6U60zOH1mM5"),
    Sea(
        "Mar Mediterrâneo",
        "é um mar entre a Europa, África e Ásia, tendo abertura e comunicação direta com o Atlântico através do estreito de Gibraltar e o Oriente Médio como limite oriental",
        "http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQ4dodIImH6Q2y4dvmuwXlvcEWGRPewQ_DmhacEVjcIiOME5SHMinNgh6U60zOH1mM5"),
  ];

  void addItem(String name, String descr, String linkImg) {
    _todos.add(Sea(name, descr, linkImg));
  }

  int get index => _index;

  set index(int value) {
    if ((value >= 0) && (value < _todos.length)) {
      _index = value;
    } else {
      _index = -1;
    }
  }

  UnmodifiableListView<Sea> get list => UnmodifiableListView<Sea>(_todos);
}
