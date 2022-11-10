import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'widgets/login.dart';

void main() {
  String accessToken = (Uri.base.queryParameters["access_token"] ?? '')
      .toString(); //get parameter with attribute "para1"
  String error = (Uri.base.queryParameters["error"] ?? '')
      .toString(); //get parameter with attribute "para2"
  runApp(WWUApp(accessToken, error));
}

class WWUApp extends StatefulWidget {
  final String accessToken;
  final String error;
  const WWUApp(this.accessToken, this.error, {super.key});

  @override
  State<WWUApp> createState() => _WWUAppState();
}

class _WWUAppState extends State<WWUApp> {
  // TODO: Get Access Key
  // Requires: Backend to set up Single Sign on Page
  // when program is updated change default accessKey to equal -1

  var _accessKey = "-1";
  var _errorState = false;
  void _updateState() {
    if (_accessKey == "AuthFailed") {
      // if in error state, on function use, change state number
      // back to the Login page's state string
      setState(() {
        _accessKey = "-1";
      });
    } else {
      // TODO: Open single sign on and collect accesskey https://login.microsoftonline.com/d958f048-e431-4277-9c8d-ebfb75e7aa64/oauth2/v2.0/authorize?client_id=b011ad62-bda8-449f-99d3-519a3d973218&response_type=code&response_mode=query&scope=https://graph.microsoft.com/User.Read&redirect_uri=https://172.27.4.142:5000/login/callback
      // URL for later:
      setState(() {
        // This is a mock
        html.window.open(
            'https://login.microsoftonline.com/d958f048-e431-4277-9c8d-ebfb75e7aa64/oauth2/v2.0/authorize?client_id=b011ad62-bda8-449f-99d3-519a3d973218&response_type=code&response_mode=query&scope=https://graph.microsoft.com/User.Read&redirect_uri=https://172.27.4.142:5000/login/callback',
            "_self");
        _accessKey = "AuthFailed";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // returns the correct widget, error, login, or home page
    // widgets dending on the accessKey
    if (!_errorState) {
      if (widget.error != '') {
        _accessKey = "AuthFailed";
        _errorState = true;
      } else if (widget.accessToken != '') {
        _accessKey = widget.accessToken;
      }
    }
    return Login(_accessKey, _updateState);
  }
}
