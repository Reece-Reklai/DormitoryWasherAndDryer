import 'package:flutter/material.dart';

import 'widgets/login.dart';

void main() {
  runApp(const WWUApp());
}

class WWUApp extends StatefulWidget {
  const WWUApp({super.key});

  @override
  State<WWUApp> createState() => _WWUAppState();
}

class _WWUAppState extends State<WWUApp> {
  // TODO: Get Access Key
  // Requires: Backend to set up Single Sign on Page

  // when program is updated change default accessKey to equal -1
  var _accessKey = '1';
  void _updateState() {
    if (_accessKey == 'AuthFailed') {
      // if in error state, on function use, change state number
      // back to the Login page's state string
      setState(() {
        _accessKey = '-1';
      });
    } else {
      // TODO: Open single sign on and collect accesskey
      // URL for later: https://login.microsoftonline.com/d958f048-e431-4277-9c8d-ebfb75e7aa64/oauth2/v2.0/authorize?client_id=b011ad62-bda8-449f-99d3-519a3d973218&response_type=code&response_mode=query&scope=https://graph.microsoft.com/User.Read
      setState(() {
        // This is a mock
        _accessKey = '1';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // returns the correct widget, error, login, or home page
    // widgets dending on the accessKey
    return Login(_accessKey, _updateState);
  }
}
