import 'package:mobx/mobx.dart';

// Inclui o arquivo que será gerado pelo pacote mobx_codegen com build_runner
part 'counter.g.dart';

// Esta é a classe usada por todo o seu aplicativo
class Counter = _Counter with _$Counter;

// A classe de store
abstract class _Counter with Store {
  // anotação para marcar o valor como observável.
  @observable
  int value = 0;
  
  // anotação para marcar o método como uma action.
  @action
  void increment() {
    value++;
  }
}
