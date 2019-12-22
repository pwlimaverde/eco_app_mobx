import 'package:mobx/mobx.dart';

part 'verticaldivider_controller.g.dart';

class VerticaldividerController = _VerticaldividerBase
    with _$VerticaldividerController;

abstract class _VerticaldividerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
