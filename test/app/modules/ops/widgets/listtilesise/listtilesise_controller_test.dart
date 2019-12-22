import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:eco_app_mobx/app/modules/ops/widgets/listtilesise/listtilesise_controller.dart';
import 'package:eco_app_mobx/app/modules/ops/ops_module.dart';

void main() {
  Modular.init(AppModule());
  bindModule(OpsModule());
  ListtilesiseController listtilesise;

  setUp(() {
    listtilesise = OpsModule.to.bloc<ListtilesiseController>();
  });

  group('ListtilesiseController Test', () {
    test("First Test", () {
      expect(listtilesise, isInstanceOf<ListtilesiseController>());
    });

    test("Set Value", () {
      expect(listtilesise.value, equals(0));
      listtilesise.increment();
      expect(listtilesise.value, equals(1));
    });
  });
}
