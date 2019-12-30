import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:eco_app_mobx/app/modules/ops/widgets/circularprogress/circularprogress_widget.dart';

main() {
  testWidgets('CircularprogressWidget has message',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(CircularprogressWidget()));
    final textFinder = find.text('Circularprogress');
    expect(textFinder, findsOneWidget);
  });
}
