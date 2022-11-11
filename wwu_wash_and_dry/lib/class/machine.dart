// Created by Catherine Thomsen and Bradon Ladd

class Machine {
  Machine(this._id, this._type, this._floor);

  final String _id;
  final String _floor;

  final String _type;
  final String _status = '';

  get id => _id;
  get type => _type;
  get floor => _floor;
  get status => _status;

  // MOCK
  String getStatus() {
    return "AVAL";
  }
}
