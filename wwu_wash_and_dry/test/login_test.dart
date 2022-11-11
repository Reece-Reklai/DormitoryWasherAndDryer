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

void main() {
  testWidgets('Login returns a Login_page on recievieng a \'-1\'',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    void updateState() {}
    await tester.pumpWidget(Login('-1', updateState));
    expect(find.text('Login Using WWU Account'), findsOneWidget);
  });
  testWidgets('Login returns a Login_page on recievieng a \'AuthFailed\'',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    void updateState() {}
    await tester.pumpWidget(Login('AuthFailed', updateState));
    expect(find.text('Return to login page'), findsOneWidget);
  });
  testWidgets('Login returns a Login_page on recievieng any other value',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    void updateState() {}
    await tester.pumpWidget(Login('1', updateState));
    expect(find.text('Sittner'), findsOneWidget);

    await tester.pumpWidget(Login('!&8209', updateState));
    expect(find.text('Sittner'), findsOneWidget);

    await tester.pumpWidget(Login('asdfasljdkh', updateState));
    expect(find.text('Sittner'), findsOneWidget);
  });
  testWidgets('default WWUApp starts on Login', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WWUApp('', ''));
    expect(find.text('Login Using WWU Account'), findsOneWidget);
  });

  testWidgets('Error WWU starts on Error Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WWUApp('dasdfs', '1'));
    expect(find.text('Return to login page'), findsOneWidget);
  });

  testWidgets('Error Page click sends you to login',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WWUApp('dasdfs', '1'));
    expect(find.text('Return to login page'), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(find.text('Return to login page'), findsOneWidget);
  });

  testWidgets('Login Page Button takes you to Home',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(const WWUApp('', ''));
    expect(find.text('Login Using WWU Account'), findsOneWidget);

    await tester.tap(find.byType(TextButton));
    await tester.pump();
    expect(find.text('Sittner'), findsOneWidget);
    expect(find.text('Foreman'), findsOneWidget);
    expect(find.text('Conard'), findsOneWidget);
  });
}
