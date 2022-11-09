import 'package:wwu_wash_and_dry/class/machine.dart';

class Floor {
  late int _floorLevel;
  late List<Machine> _dryerList = [];
  late List<Machine> _washerList = [];

  void generateMachineList(List<String> totalMachine, String machineType) {
    if (machineType == "Dryers") {
      for (var eachMachine = 0;
          eachMachine < totalMachine.length;
          eachMachine++) {
        var currMachine =
            new Machine(totalMachine[eachMachine], machineType, "", true);
        _dryerList.add(currMachine);
      }
    } else {
      for (var eachMachine = 0;
          eachMachine < totalMachine.length;
          eachMachine++) {
        var currMachine =
            new Machine(totalMachine[eachMachine], machineType, "", true);
        _washerList.add(currMachine);
      }
    }
  }

  Floor(int floorLevel, List<String> totalDryerMachine,
      List<String> totalWasherMachine) {
    this._floorLevel = floorLevel;
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
