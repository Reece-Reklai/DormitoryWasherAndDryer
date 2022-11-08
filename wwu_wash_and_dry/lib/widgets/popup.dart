// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

enum MachineLocation {
  sittner,
  foreman_1,
  foreman_2,
  foreman_3,
  foreman_4,
  foreman_5,
  foreman_6,
  foreman_7,
  conard_1,
  conard_2,
  conard_3,
  conard_4,
}

enum MachineType {
  washer,
  drier,
}

enum MachineStatus {
  availible,
  unavailible,
  outOfOrder,
}

class Machine {
  // defaults
  MachineLocation location = MachineLocation.sittner;
  MachineType type = MachineType.washer;
  int id = 0;
  MachineStatus status = MachineStatus.availible;
  // int time = 0;
  Machine(this.location, this.type, this.id, this.status);

  String getStatus() {
    if (status == MachineStatus.availible) {
      return 'Availible';
    } else if (status == MachineStatus.unavailible) {
      return 'Unavailable';
    } else if (status == MachineStatus.outOfOrder) {
      return 'Out of Order';
    } else {
      return 'Error';
    }
  }
}

Future popup(var context, var location, var type, var id) {
  // context - Required
  // location (floor or dormintory)
  // machine number or id
  // machine type

  var test = Machine(MachineLocation.sittner, MachineType.washer, 1,
      MachineStatus.unavailible);

  var time = 120;
  var readable_time = intToTimeLeft(time);

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
        title: Text('Washer $id'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //position
          mainAxisSize: MainAxisSize.min,
          // wrap content in flutter
          children: <Widget>[
            Text('Status: ' + test.getStatus()),
            Text('Time: $readable_time'),
          ],
        ),
        actions: [
          Align(
              alignment: AlignmentDirectional.topEnd,
              child: TextButton(
                onPressed: (() => Navigator.pop(context)),
                child: const Text('OK'),
              )),
        ]),
  );
}

Future? api_call(var location, var type, var id) {
  // This function is meant to call the api and fill up the internal database for the pop up
  return null;
}

//https://dev.to/devlonoah/convert-integer-value-to-hour-minute-seconds-in-dart-48hc
String intToTimeLeft(int value) {
  int h, m, s;
  h = value ~/ 3600;
  m = ((value - h * 3600)) ~/ 60;
  s = value - (h * 3600) - (m * 60);
  // String hourLeft = h.toString().length < 2 ? '0' + h.toString() : h.toString();
  var minuteLeft =
      m.toString().length < 2 ? '0' + m.toString() : m.toString();
  var secondsLeft =
      s.toString().length < 2 ? '0' + s.toString() : s.toString();
  var result = '$minuteLeft:$secondsLeft';
  return result;
}
