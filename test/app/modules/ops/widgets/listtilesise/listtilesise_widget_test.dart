import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:eco_app_mobx/app/modules/ops/widgets/listtilesise/listtilesise_widget.dart';

main() {
  testWidgets('ListtilesiseWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ListtilesiseWidget()));
    final textFinder = find.text('Listtilesise');
    expect(textFinder, findsOneWidget);
  });
}
