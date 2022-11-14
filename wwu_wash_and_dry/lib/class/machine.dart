import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Machine extends Equatable {
  String _id = "#0";
  String _type = "";
  String selfReportStatus = "NONE";
  bool isAvailable = false;

  Machine(String id, String type, String selfReportStatus) {
    _id = id;
    _type = type;
    selfReportStatus = selfReportStatus;
    isAvailable = true;
  }

  String get getID {
    return _id;
  }

  String get getType {
    return _type;
  }

  String get getSelfReportStatus {
    return selfReportStatus;
  }

  bool get getIsAvailable {
    return isAvailable;
  }

  // MOCK
  String getStatus() {
    return "AVAL";
  }

  @override
  String toString() {
    return '[$_id, $_type, $selfReportStatus, $isAvailable]';
  }
  
  @override
  List<Object?> get props => [_id, _type, selfReportStatus, isAvailable];
}
