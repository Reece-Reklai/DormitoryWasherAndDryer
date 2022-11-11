import 'package:wwu_wash_and_dry/class/floor.dart';

class Building {
  late String _buildingName;
  List<Floor> _floorList = [];

  void createFloor(int currFloor, List<String> dryerIDs, List<String> washerIDs) {
    var floor = Floor(currFloor, []);
    // var floor = new Floor(currFloor, dryerIDs, washerIDs);
    _floorList.add(floor);
  }

  Building(String buildingName, int numFloors, List<List<String>> dryerIDs,
      List<List<String>> washerIDs) {
    this._buildingName = buildingName;
    for (var eachFloor = 1; eachFloor < numFloors + 1; eachFloor++) {
      createFloor(eachFloor, dryerIDs[eachFloor - 1], washerIDs[eachFloor - 1]);
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
