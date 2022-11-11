import 'package:flutter/rendering.dart';
import 'package:wwu_wash_and_dry/class/machine.dart';
import 'package:wwu_wash_and_dry/widgets/login_error.dart';

class Floor {
  late int _floorLevel;
  late List<Machine> _machineList;
  late List<Machine> _dryerList = [];
  late List<Machine> _washerList = [];

  Floor(int floorLevel, List<Machine> machineList) {
    _floorLevel = floorLevel;
    _machineList = machineList;
    _dryerList = generateMachineListTEST(_machineList, "Dryer");
    _washerList = generateMachineListTEST(_machineList, "Washer");
  }

  List<Machine> generateMachineListTEST(
      List<Machine> totalMachine, String machineType) {
    List<Machine> list = [];

    for (var each in _machineList) {
      if (each.getType == machineType) {
        list.add(each);
      }
    }
    return list;
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
