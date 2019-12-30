import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:eco_app_mobx/app/modules/ops/widgets/iconbutton/iconbutton_widget.dart';

main() {
  testWidgets('IconbuttonWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(IconbuttonWidget()));
    final textFinder = find.text('Iconbutton');
    expect(textFinder, findsOneWidget);
  });
}
