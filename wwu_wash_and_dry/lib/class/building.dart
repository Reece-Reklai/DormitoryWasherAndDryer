import 'package:wwu_wash_and_dry/class/floor.dart';

class Building {
  late String _buildingName;
  List<Floor> floorList = [];

  void createFloor(int currentFloor, List<String> dryerIDs, List<String> washerIDs) {
    final floor = Floor(currentFloor, dryerIDs, washerIDs);
    floorList.add(floor);
  }

  Building(
      String buildingName, int numFloors, List<List<String>> dryerIDs, List<List<String>> washerIDs,) {
    _buildingName = buildingName;
    for (var eachFloor = 1; eachFloor < numFloors + 1; eachFloor++) {
      createFloor(eachFloor, dryerIDs[eachFloor-1], washerIDs[eachFloor-1]);
    }
  }
  
  String get buildingName => _buildingName;
}
