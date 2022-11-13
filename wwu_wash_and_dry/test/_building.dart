// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:wwu_wash_and_dry/class/building.dart';

void main() {
  test('Building Class Test', () {
    // Arrange
    final listWasher = List.filled(5, "washer");
    final washers = List.filled(5, listWasher);
    final listDryer = List.filled(5, "dryer");
    final dryers = List.filled(5, listDryer);

    // Act
    final sittner = Building("Sittner", 1, washers, dryers);

    // Assert
    expect(sittner.buildingName, "Sittner");
  });
}
