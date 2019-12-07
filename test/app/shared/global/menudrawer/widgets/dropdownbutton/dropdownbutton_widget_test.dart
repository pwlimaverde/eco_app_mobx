import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:eco_app_mobx/app/shared/global/menudrawer/widgets/dropdownbutton/dropdownbutton_widget.dart';

main() {
  testWidgets('DropdownbuttonWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(DropdownbuttonWidget()));
    final textFinder = find.text('Dropdownbutton');
    expect(textFinder, findsOneWidget);
  });
}
