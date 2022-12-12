// ignore_for_file: avoid_dynamic_calls

import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'dart:developer';

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

class MachineData {
  // defaults
  String location = "";
  int floor = 0;
  int id = 0;
  String status = "";
  // int time = 0;
  MachineData(this.location, this.floor, this.id, this.status);

  String getStatus() {
    return status;
  }
}

Future popup(
  BuildContext context,
  String dorm,
  String floor,
  String machineId,
  String token,
) async {
  // context - Required
  // location (floor or dormintory)
  // machine number or id
  // machine type

  var time = 120;
  var readableTime = intToTimeLeft(time);

  final MachineData? machine =
      // ignore: cast_nullable_to_non_nullable
      await createMachine(dorm, floor, machineId, token);

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Washer $machineId'),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //position
        mainAxisSize: MainAxisSize.min,
        // wrap content in flutter
        children: <Widget>[
<<<<<<< HEAD
          //Text('Status: ${machine.getStatus()}'),
          Text('Status: ${machine?.getStatus()}'),
=======
          Text('Status: ${machine.getStatus()}'),
          // const Text('Status: Avalible'),
>>>>>>> cc9a3c98b51dc5ad5091bab92aa3e721c4611278
          Text('Finish Time: $readableTime'),
        ],
      ),
      actions: [
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ),
      ],
    ),
  );
}

Future<MachineData>? createMachine(
  String dorm,
  String floor,
  String machineId,
  String token,
) async {
  // This function is meant to call the api and fill up the internal database for the pop up
  const String _baseUrl = "https://wwuwashanddryapi.cs.wallawalla.edu/machine/";
  final String url = "$dorm/$floor/$machineId";
  const String tempToken =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwdWJsaWNfaWQiOiJjYWI1MzA4MS1hNmVhLTRiMmItOTM3OS01ZjM5MjdmMDI0MWUiLCJleHAiOjE2NzA4NzkwMDN9._wCV4byFUkbS2eSHXOqyJO0NGi918G7Bk_6Qu-SOPG8";
  // final String temp = Uri.base as String;
  // final List values = temp.split("token=");
  // // ignore: unused_local_variable
  // final String accessToken = values[1] as String;
  log(_baseUrl + url);
  final response = await http.get(
    Uri.parse(_baseUrl + url),
    headers: {
      'access_token': token,
    },
  );
  final body = jsonDecode(response.body);
  //final finishTime = body['Finish_Time'].toString();

  return MachineData(
    dorm,
    int.parse(floor),
    int.parse(machineId),
    body['Status'].toString(),
  );
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
