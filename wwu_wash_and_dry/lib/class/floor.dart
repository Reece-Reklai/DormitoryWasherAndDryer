import 'package:equatable/equatable.dart';
import 'package:wwu_wash_and_dry/class/machine.dart';

// ignore: must_be_immutable
class Floor extends Equatable {
  int _floorLevel = 0;
  final List<Machine> _dryerList = [];
  final List<Machine> _washerList = [];

  void generateMachineList(List<String> totalMachine, String machineType) {
    if (machineType == "Dryer") {
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

  Floor(
    int floorLevel,
    List<String> totalDryerMachine,
    List<String> totalWasherMachine,
  ) {
    _floorLevel = floorLevel;
    generateMachineList(totalDryerMachine, "Dryer");
    generateMachineList(totalWasherMachine, "Washer");
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

  @override
  String toString() {
    return '[$_floorLevel, $_dryerList, $_washerList]';
  }
  
  @override
  List<Object?> get props => [_floorLevel, _dryerList, _washerList];
}
