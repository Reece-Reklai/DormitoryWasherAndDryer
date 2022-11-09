import 'package:wwu_wash_and_dry/class/floor.dart';

class Machine {
  late int _id;
  late String _type;
  late String _selfReportStatus;
  late bool _isAvailable;

  Machine(int id, String type, String selfReportStatus, bool isAvailable) {
    this._id = id;
    this._type = type;
    this._selfReportStatus = selfReportStatus;
    this._isAvailable = isAvailable;
  }

  int get getID {
    return _id;
  }

  String get getType {
    return _type;
  }

  String get getSelfReportStatus {
    return _selfReportStatus;
  }

  bool get getIsAvailable {
    return _isAvailable;
  }

  set setSelfReportStatus(String selfReportStatus) {
    _selfReportStatus = selfReportStatus;
  }

  set setIsAvailable(bool isAvailable) {
    _isAvailable = isAvailable;
  }

  // MOCK
  String getStatus() {
    return "AVAL";
  }
}
