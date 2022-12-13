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
  String time = "";
  // int time = 0;
  MachineData(this.location, this.floor, this.id, this.status, this.time);

  String getStatus() {
    return status;
  }

  String getTime() {
    return time;
  }
}

Future popup(
  BuildContext context,
  String type,
  String dorm,
  String floor,
  String machineId,
  String token,
) async {
  // context - Required
  // location (floor or dormintory)
  // machine number or id
  // machine type

  final MachineData? machine =
      // ignore: cast_nullable_to_non_nullable
      await createMachine(dorm, floor, machineId, token);

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('$type $machineId'),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //position
        mainAxisSize: MainAxisSize.min,
        // wrap content in flutter
        children: <Widget>[
          Text('Status: ${machine?.getStatus()}'),
          // const Text('Status: Avalible'),
          Text('Finish Time: ${machine?.getTime()}'),
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
  const String baseUrl = "https://wwuwashanddryapi.cs.wallawalla.edu/machine/";
  final String url = "$dorm/$floor/$machineId";
  // const String tempToken =
  //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwdWJsaWNfaWQiOiJjYWI1MzA4MS1hNmVhLTRiMmItOTM3OS01ZjM5MjdmMDI0MWUiLCJleHAiOjE2NzA4ODkzMjZ9.igsAxMp0nbfJiZC5t4oafTFHeTQkVu7VC0iNFNoWBHw";
  log(baseUrl + url);
  final response = await http.get(
    Uri.parse(baseUrl + url),
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
    twentyFourTotwelve(body['Finish_Time'].toString()),
  );
}

String twentyFourTotwelve(String time) {
  if (time == "null") {
    return "None";
  }
  final times = time.split(':');
  var hours = int.parse(times[0]);
  var returnTime = "";
  if (hours < 12) {
    returnTime = "$hours:${times[1]} AM";
  } else if (hours == 12) {
    returnTime = "$hours:${times[1]} PM";
  } else {
    hours -= 12;
    returnTime = "$hours:${times[1]} PM";
  }
  return returnTime;
}
