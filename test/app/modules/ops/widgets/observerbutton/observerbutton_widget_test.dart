import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:eco_app_mobx/app/modules/ops/widgets/observerbutton/observerbutton_widget.dart';

main() {
  testWidgets('ObserverbuttonWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ObserverbuttonWidget()));
    final textFinder = find.text('Observerbutton');
    expect(textFinder, findsOneWidget);
  });
}
