// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_compare/LF/lfmain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('LookAndFeelWidget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LookFeelPage(),));

    expect(find.text('This is a raised Button'), findsOneWidget);
    expect(find.byKey(Key('tfKey')), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'UI Tests works!');

    expect(find.text('UI Tests works!'), findsOneWidget);

  });
}
