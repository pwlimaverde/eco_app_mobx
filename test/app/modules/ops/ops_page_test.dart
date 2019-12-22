import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:eco_app_mobx/app/modules/ops/ops_page.dart';

main() {
  testWidgets('OpsPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(OpsPage(title: 'Ops')));
    final titleFinder = find.text('Ops');
    expect(titleFinder, findsOneWidget);
  });
}
