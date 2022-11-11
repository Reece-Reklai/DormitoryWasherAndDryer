import 'package:flutter/rendering.dart';
import 'package:wwu_wash_and_dry/class/machine.dart';
import 'package:wwu_wash_and_dry/widgets/login_error.dart';

class Floor {
  late int _floorLevel;
  late List<Machine> _dryerList = [];
  late List<Machine> _washerList = [];

  Floor(int floorLevel, List<String> totalDryerMachine,
      List<String> totalWasherMachine) {
    _floorLevel = floorLevel;
    _dryerList = generateMachineListTEST(totalDryerMachine, "Dryers");
    _washerList = generateMachineListTEST(totalWasherMachine, "Washers");
  }

  List<Machine> generateMachineListTEST(List<String> totalMachine, String machineType) {
    List<Machine> list = [];

    for (var each in totalMachine) {
      var newMachine = Machine(each, machineType, "", true);
      list.add(newMachine);
    }
    return list;
  }

  // void generateMachineList(List<String> totalMachine, String machineType) {
  //   if (machineType == "Dryers") {
  //     for (var eachMachine = 0;
  //         eachMachine < totalMachine.length;
  //         eachMachine++) {
  //       var currMachine =
  //           new Machine(totalMachine[eachMachine], machineType, "", true);
  //       _dryerList.add(currMachine);
  //     }
  //   } else {
  //     for (var eachMachine = 0;
  //         eachMachine < totalMachine.length;
  //         eachMachine++) {
  //       var currMachine =
  //           new Machine(totalMachine[eachMachine], machineType, "", true);
  //       _washerList.add(currMachine);
  //     }
  //   }
  // }

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
