import 'package:mobx/mobx.dart';

part 'sizedboxw2_controller.g.dart';

class Sizedboxw2Controller = _Sizedboxw2Base with _$Sizedboxw2Controller;

abstract class _Sizedboxw2Base with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
