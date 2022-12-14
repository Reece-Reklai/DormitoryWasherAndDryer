// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wwu_wash_and_dry/class/dorm_data.dart';
import 'package:wwu_wash_and_dry/class/floor.dart';
import 'package:wwu_wash_and_dry/main.dart';
import 'package:wwu_wash_and_dry/widgets/drop_down_list.dart';
import 'package:wwu_wash_and_dry/widgets/floor_layout.dart';
import 'package:wwu_wash_and_dry/widgets/home_page.dart';
import 'package:wwu_wash_and_dry/widgets/login.dart';

// all tests in this file must be run from a web platform
// use flutter test --platform chrome to execute properly
// flutter test --platform chrome -r expanded

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
  group('Home Page Tests', () {
    group('Drop Down Tests', () {
      testWidgets('there are two floor drop downs',
          (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(const HomePage('This_token_has_no_features'));
        // final firstDD = find.byType(DropDownList);
        expect(find.byType(DropDownList), findsNWidgets(2));
      });
      testWidgets('drop downs have expected size', (WidgetTester tester) async {
        await tester.pumpWidget(const HomePage('This_token_has_no_features'));
        expect(find.byType(DropdownMenuItem<String>), findsNWidgets(10));
      });
      testWidgets('drop downs have expected format and names',
          (WidgetTester tester) async {
        await tester.pumpWidget(const HomePage('This_token_has_no_features'));
        // final ddformat = RegExp(r'[A-Z]\d+');
        const floors = [
          'C1',
          'C2',
          'C3',
          'C4',
          'F2',
          'F3',
          'F4',
          'F5',
          'F6',
          'F7'
        ];
        for (final element in floors) {
          expect(
            find.descendant(
              of: find.byType(DropdownMenuItem<String>),
              matching: find.text(element),
            ),
            findsOneWidget,
          );
        }
      });
    });
    // TODO: group('Selection Layering', () {});
  });

  group('Floor Layout Tests', () {
    testWidgets('Testing with an empty list from floor class',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      final List<List<String>> test = [
        [''],
        ['']
      ];
      await tester
          .pumpWidget(FloorLayout(floorObj: Floor(0, test[0], test[1])));
      expect(
        find.descendant(
          of: find.byType(ListTile),
          matching: find.text('Washer 1'),
        ),
        findsNothing,
      );
    });

    testWidgets('Testing with a list filled with input from floor class',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester
          .pumpWidget(FloorLayout(floorObj: Floor(0, sittner[0], sittner[1])));
      expect(
        find.descendant(
          of: find.byType(ListTile),
          matching: find.text('Washer 1'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(ListTile),
          matching: find.text('Dryer 1'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(ListTile),
          matching: find.text('Washer 2'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(ListTile),
          matching: find.text('Dryer 2'),
        ),
        findsOneWidget,
      );
    });
  });
}
