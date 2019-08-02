// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_compare/LF/lfmain.dart';
import 'package:flutter_compare/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_compare/Perf/perform.dart';

void main() {

  testWidgets('LookAndFeelWidget', (WidgetTester tester) async {
    
    await tester.pumpWidget(MyApp());
    expect(find.byTooltip('Open navigation menu'), findsOneWidget);
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pump();
    expect(find.byKey(Key('LFDrawer')), findsOneWidget);
    await tester.tap(find.byKey(Key('LFDrawer')));
    //await tester.pumpAndSettle();
    // eigentlich mocken der navigation -> mehraufwand den man hier getrost weglassen kann
    await tester.pumpWidget(MaterialApp(home: LookFeelPage(),));
    expect(find.byKey(Key('tfKey')), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'UI Tests works!');
    expect(find.text('UI Tests works!'), findsOneWidget);
  });

  test('Generate test', () {
    var p = GenerateClass();
    List<dynamic> l = p.generate();
    expect(l.length, 20);
  });
}
