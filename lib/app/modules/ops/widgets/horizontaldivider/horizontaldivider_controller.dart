import 'package:mobx/mobx.dart';

part 'horizontaldivider_controller.g.dart';

class HorizontaldividerController = _HorizontaldividerBase
    with _$HorizontaldividerController;

abstract class _HorizontaldividerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
