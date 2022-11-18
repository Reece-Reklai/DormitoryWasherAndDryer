import 'dart:_interceptors';

// TODO: make this mock what getting the JSON object will be like
// TODO: confirm types with backend

// import 'package:json_annotation/json_annotation.dart';
// https://www.topcoder.com/thrive/articles/working-with-json-in-flutter

class GetMachine {
  Map<String, dynamic> dummy = { "Public_ID": 1, "Floor_ID": 1, "Floor": 0, "Dorm": "Sittner", "Status": "free", "Last_Service_Date": "10/27/2022", "Installation_Date": "10/27/2022", "Finish_Time": "None", "User_Name": "Evan", }
  Map<String, dynamic> getDummy() {
    return dummy;
  }
}

class PutMachine {
  Map<String, dynamic> dummy = { "Public_ID": 1, "Floor_ID": 1, "Floor": 0, "Dorm": "Sittner", "Status": "free", "Last_Service_Date": "10/27/2022", "Installation_Date": "10/27/2022", "Finish_Time": "None", "User_Name": "Evan", }
  Map<String, dynamic> getDummy() {
    return dummy;
  }
}

class GetFloorId {
Map<String, dynamic> dummy = { "Public_ID": 1, "Status": "in_use", "Finish_Time": "10:27", "User_Name": "Evan" };
    Map<String, dynamic> getDummy() {
    return dummy;
  }
}