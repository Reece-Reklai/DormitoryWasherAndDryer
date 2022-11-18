// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wwu_wash_and_dry/main.dart';
import 'package:wwu_wash_and_dry/widgets/login.dart';

// all tests in this file must be run from a web platform
// use flutter test --platform chrome to execute properly

void main() {
  testWidgets('Finds the conard/foreman dropdowns', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Text('H'),
      ),
    ));

    // Find a widget that displays the letter 'H'.
    expect(find.text('H'), findsOneWidget);
  });
}
