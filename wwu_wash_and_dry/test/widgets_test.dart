// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:js/js_util.dart';
import 'package:wwu_wash_and_dry/main.dart';
import 'package:wwu_wash_and_dry/widgets/drop_down_list.dart';
import 'package:wwu_wash_and_dry/widgets/login.dart';
import 'package:wwu_wash_and_dry/widgets/home_page.dart';

// all tests in this file must be run from a web platform
// use flutter test --platform chrome to execute properly
// for this file: flutter test test\widgets_test.dart --platform chrome
// Other useful additions: -r expanded
void main() {
  group('Login Tests', () {
    testWidgets("Login returns a Login_page on receiving a '-1'",
        (WidgetTester tester) async {
      // Build our app and trigger a frame.

      void updateState() {}
      await tester.pumpWidget(Login('-1', updateState));
      expect(find.text('Login Using WWU Account'), findsOneWidget);
    });
    testWidgets("Login returns a Login_page on receiving a 'AuthFailed'",
        (WidgetTester tester) async {
      // Build our app and trigger a frame.

      void updateState() {}
      await tester.pumpWidget(Login('AuthFailed', updateState));
      expect(find.text('Return to login page'), findsOneWidget);
    });
    testWidgets('Login returns a Login_page on receiving any other value',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.

      void updateState() {}
      await tester.pumpWidget(Login('1', updateState));
      expect(find.text('Foreman'), findsOneWidget);

      await tester.pumpWidget(Login('!&8209', updateState));
      expect(find.text('Foreman'), findsOneWidget);

      await tester.pumpWidget(Login('asdfasljdkh', updateState));
      expect(find.text('Foreman'), findsOneWidget);
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
      expect(find.text('WWU Wash and Dry Login'), findsOneWidget);
    });
  });
  group('Drop Down Tests', () {
    testWidgets('there are two floor drop downs', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const HomePage('This_token_has_no_features'));
      // final firstDD = find.byType(DropDownList);
      expect(find.byType(DropDownList), findsNWidgets(2));
    });
    final dropDowns = find.byType(DropdownMenuItem<String>);
    testWidgets('drop downs have expected size', (WidgetTester tester) async {
      await tester.pumpWidget(const HomePage('This_token_has_no_features'));
      expect(dropDowns, findsNWidgets(10));
    });
    testWidgets('drop downs have expected format', (WidgetTester tester) async {
      await tester.pumpWidget(const HomePage('This_token_has_no_features'));
      // final textValues = dropDowns.allCandidates.map((element) { return element.})
      expect(dropDowns, findsNWidgets(10));
    });
  });

  group('');
}
