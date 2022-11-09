class Machine {
  Machine(this._id, this._type);
  Machine(this._id, this._type);

  final int _id;
  final String _type;
  final String _selfReportStatus = '';

  bool _status = true;

  get id => _id;
  get type => _type;
  get selfReportStatus => _selfReportStatus;
  get status => _status;

  // MOCK
  String getStatus() {
    return "AVAL";
  }
}