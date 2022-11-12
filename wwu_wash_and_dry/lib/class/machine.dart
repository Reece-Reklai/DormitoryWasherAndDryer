class Machine {
  late String _id;
  late String _type;
  late String selfReportStatus;
  late bool isAvailable;

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
}
