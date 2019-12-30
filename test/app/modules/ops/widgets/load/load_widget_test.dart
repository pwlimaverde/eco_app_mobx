import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:eco_app_mobx/app/modules/ops/widgets/load/load_widget.dart';

main() {
  testWidgets('LoadWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(LoadWidget()));
    final textFinder = find.text('Load');
    expect(textFinder, findsOneWidget);
  });
}
