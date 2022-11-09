import 'package:wwu_wash_and_dry/class/floor.dart';

class Building {
  late String _buildingName;
  List<Floor> _floorList = [];

  void createFloor(int currFloor, int totalDryer, int totalWasher) {
    var floor = new Floor(currFloor, totalDryer, totalWasher);
    _floorList.add(floor);
  }

  Building(
      String buildingName, int numFloors, List<int> totalDryer, List<int> totalWasher) {
    this._buildingName = buildingName;
    for (var eachFloor = 1; eachFloor < numFloors + 1; eachFloor++) {
      createFloor(eachFloor, totalDryer[eachFloor-1], totalWasher[eachFloor-1]);
    }
  }

  String get getBuildingName {
    return _buildingName;
  }

  List<Floor> get getFloorList {
    return _floorList;
  }

  set setFloor(List<Floor> floorList) {
    _floorList = floorList;
  }
}
