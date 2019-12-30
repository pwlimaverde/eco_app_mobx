import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:eco_app_mobx/app/modules/ops/widgets/errorrefresh/errorrefresh_widget.dart';

main() {
  testWidgets('ErrorrefreshWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ErrorrefreshWidget()));
    final textFinder = find.text('Errorrefresh');
    expect(textFinder, findsOneWidget);
  });
}
