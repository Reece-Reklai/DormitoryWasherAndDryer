// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:test/test.dart';
import 'package:wwu_wash_and_dry/class/building.dart';
import 'package:wwu_wash_and_dry/class/floor.dart';
import 'package:wwu_wash_and_dry/class/machine.dart';

void main() {
  group("Building Class", () {
    test("No Input", () {
      const testNumFloors = 0;
      final testDryerIDs = List.filled(0, [""]);
      final testWasherIDs = List.filled(0, [""]);
      const testBuildingName = "";

      final testClass = Building(
          testBuildingName, testNumFloors, testDryerIDs, testWasherIDs,);

      expect(testClass.buildingName, "");
      expect(testClass.floorList, []);
    });

    test('With Input', () {
      const testNumFloors = 1;
      final testDryerIDs = [
        ["#001", "#002"]
      ];
      final testWasherIDs = [
        ["#001", "#002"]
      ];
      const testBuildingName = "Sittner";

      final testBuildingClass = Building(
        testBuildingName,
        testNumFloors,
        testDryerIDs,
        testWasherIDs,
      );

      final List<Floor> testFloorList = [
        Floor(1, const ["#001", "#002"], const ["#001", "#002"])
      ];

      expect(testBuildingClass.buildingName, "Sittner");
      expect(testBuildingClass.floorList, equals(testFloorList));
    });
  });

  group("Floor Class", () {
    test("No Input", () {
      const testFloorLevel = 1;
      final testDryerIDs = List.filled(0, "");
      final testWasherIDs = List.filled(0, "");

      final testClass = Floor(testFloorLevel, testDryerIDs, testWasherIDs);

      expect(testClass.getFloorLevel, 1);
      expect(testClass.getDryerList, []);
      expect(testClass.getWasherList, []);
    });

    test('With Input', () {
      const testFloorLevel = 2;
      final testDryerIDs = ["#001", "#002"];
      final testWasherIDs = ["#001", "#002"];

      final testClass = Floor(testFloorLevel, testDryerIDs, testWasherIDs);

      final List<Machine> testMachineDryerList = [
        Machine("#001", "Dryer", "NONE"),
        Machine("#002", "Dryer", "NONE")
      ];

      final List<Machine> testMachineWasherList = [
        Machine("#001", "Washer", "NONE"),
        Machine("#002", "Washer", "NONE")
      ];

      expect(testClass.getFloorLevel, 2);
      expect(testClass.getDryerList, testMachineDryerList);
      expect(testClass.getWasherList, testMachineWasherList);
    });
  });

  group("Machine Class", () {
    test("No Input", () {
      const testID = "#0";
      const testType = "";
      const testselfReportStatus = "NONE";

      final testClass = Machine(testID, testType, testselfReportStatus);

      expect(testClass.getID, "#0");
      expect(testClass.getType, "");
      expect(testClass.getSelfReportStatus, "NONE");
      expect(testClass.getIsAvailable, true);
    });

    test('With Input', () {
      const testID = "#001";
      const testType = "Dryer";
      const testselfReportStatus = "NONE";

      final testClass = Machine(testID, testType, testselfReportStatus);

      expect(testClass.getID, "#001");
      expect(testClass.getType, "Dryer");
      expect(testClass.getSelfReportStatus, "NONE");
      expect(testClass.getIsAvailable, true);
    });
  });
}
