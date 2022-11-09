import 'package:wwu_wash_and_dry/class/machine.dart';

class Floor {
  late int _floorLevel;
  late List<Machine> _machineList = [];

  void createMachine(int totalMachine, String machineType) {
    for (var eachMachine = 1; eachMachine < totalMachine + 1; eachMachine++) {
      var currMachine = new Machine(eachMachine, machineType, "", true);
      _machineList.add(currMachine);
    }
  }

  Floor(int floorLevel, int totalDryer, int totalWasher) {
    this._floorLevel = floorLevel;
    createMachine(totalDryer, "Dryers");
    createMachine(totalWasher, "Washers");
  }

  int get getFloorLevel {
    return _floorLevel;
  }

  List<Machine> get getMachineList {
    return _machineList;
  }
}
