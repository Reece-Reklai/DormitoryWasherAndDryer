import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wwu_wash_and_dry/widgets/drop_down_list.dart';
import 'package:wwu_wash_and_dry/widgets/home_page.dart';
import 'package:wwu_wash_and_dry/widgets/floor_layout.dart';

// all tests in this file must be run from a web platform
// use flutter test --platform chrome to execute properly

void main() {
  testWidgets('Test drop down list', (WidgetTester tester) async {
    String titleReturned = "";
    String itemReturned = "";

    void _updatePage(String title, String item) {
      titleReturned = title;
      itemReturned = item;
    }

    await tester.pumpWidget(
      DropDownList("Displayed Value", const ["item1", "item2"], _updatePage),
    );
    await tester.tap(find.byType(DropdownButton));
    await tester.pump();
    await tester.tap(find.text("item1"));
    expect(titleReturned, "Displayed Value");
    expect(itemReturned, "item1");
  });
}
