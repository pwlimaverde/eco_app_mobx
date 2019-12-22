import 'package:mobx/mobx.dart';

part 'listtilesise_controller.g.dart';

class ListtilesiseController = _ListtilesiseBase with _$ListtilesiseController;

abstract class _ListtilesiseBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
