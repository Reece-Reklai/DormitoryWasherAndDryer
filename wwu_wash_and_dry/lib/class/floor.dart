import 'package:wwu_wash_and_dry/class/machine.dart';

class Floor {
  late int _floorLevel;
  late final List<Machine> _dryerList = [];
  late final List<Machine> _washerList = [];

  void generateMachineList(List<String> totalMachine, String machineType) {
    if (machineType == "Dryers") {
      for (var eachMachine = 0;
          eachMachine < totalMachine.length;
          eachMachine++) {
        final currentMachine =
            Machine(totalMachine[eachMachine], machineType, "");
        _dryerList.add(currentMachine);
      }
    } else {
      for (var eachMachine = 0;
          eachMachine < totalMachine.length;
          eachMachine++) {
        final currentMachine =
            Machine(totalMachine[eachMachine], machineType, "");
        _washerList.add(currentMachine);
      }
    }
  }

  Floor(int floorLevel, List<String> totalDryerMachine,
      List<String> totalWasherMachine,) {
    _floorLevel = floorLevel;
    generateMachineList(totalDryerMachine, "Dryers");
    generateMachineList(totalWasherMachine, "Washers");
  }

  int get getFloorLevel {
    return _floorLevel;
  }

  List<Machine> get getDryerList {
    return _dryerList;
  }

  List<Machine> get getWasherList {
    return _washerList;
  }
}
