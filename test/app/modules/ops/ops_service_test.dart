import 'package:flutter_test/flutter_test.dart';

import 'package:eco_app_mobx/app/modules/ops/ops_service.dart';

void main() {
  OpsService service;

  setUp(() {
    service = OpsService();
  });

  group('OpsService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<OpsService>());
    });
  });
}
