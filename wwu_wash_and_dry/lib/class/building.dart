import 'dart:js_util';

import 'package:wwu_wash_and_dry/class/floor.dart';

class Building {
  // ignore: empty_constructor_bodies
  Building(this._buildingName, this._numFloors) {
    
  };

  int _numFloors;
  final String _buildingName;
  

  
  // final String _type;
  // String _status = '';

  String get getBuildingName {
    return _buildingName;
  }

  // get type => _type;
  // get floor => _floor;
  // get status => _status;

  // // MOCK
  // String getStatus() {
  //   return "AVAL";
  // }
}