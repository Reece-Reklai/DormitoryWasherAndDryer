import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// dynamic _returnResponse(http.Response response) {
//   switch (response.statusCode) {
//     case 200:
//       var responseJson = json.decode(response.body.toString());
//       print(responseJson);
//       return responseJson;
//     case 400:
//       throw BadRequestException(response.body.toString());
//     case 401:
//     case 403:
//       throw UnauthorisedException(response.body.toString());
//     case 500:
//     default:
//       throw FetchDataException(
//           'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
//   }
// }

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

Future popup(BuildContext context, var location, var type, var id) {
  // context - Required
  // location (floor or dormintory)
  // machine number or id
  // machine type

  var test = Machine(MachineLocation.sittner, MachineType.washer, 1,
      MachineStatus.unavailible);

  var time = 120;
  var readableTime = intToTimeLeft(time);

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
            Text('Status: ${test.getStatus()}'),
            Text('Time: $readableTime'),
          ],
        ),
        actions: [
          Align(
              alignment: AlignmentDirectional.topEnd,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              )),
        ]),
  );
}

Future? apiCall(String dorm, String floor, String machineId) async {
  // This function is meant to call the api and fill up the internal database for the pop up
  const String _baseUrl = "https://wwuwashanddryapi.cs.wallawalla.edu/machine";
  String url = "dorm=$dorm&floor=$floor&floor_id=$machineId";
  const String tempToken =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwdWJsaWNfaWQiOiJjYWI1MzA4MS1hNmVhLTRiMmItOTM3OS01ZjM5MjdmMDI0MWUiLCJleHAiOjE2NzAyMTYyMTJ9.PxPUm4KKvsYKG073QwRVYGuIzCT6FKDoknCtkB6N5og";
  final String temp = Uri.base as String;
  final List values = temp.split("token=");
  // ignore: unused_local_variable
  final String accessToken = values[1] as String;

  final response = await http.get(
    Uri.parse(_baseUrl + url),
    headers: {
      HttpHeaders.authorizationHeader: tempToken,
    },
  );
  return jsonDecode(response.body);
}

//https://dev.to/devlonoah/convert-integer-value-to-hour-minute-seconds-in-dart-48hc
String intToTimeLeft(int value) {
  int h, m, s;
  h = value ~/ 3600;
  m = (value - h * 3600) ~/ 60;
  s = value - (h * 3600) - (m * 60);
  // String hourLeft = h.toString().length < 2 ? "0" + h.toString() : h.toString();
  final String minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();
  final String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();
  final String result = "$minuteLeft:$secondsLeft";
  return result;
}
