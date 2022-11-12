// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login returns a Login_page on recievieng a \'-1\'',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    void updateState() {}
    await tester.pumpWidget(Login('-1', updateState));
    expect(find.text('Login Using WWU Account'), findsOneWidget);
  });
}