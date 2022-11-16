import 'dart:html' as html;

import 'package:flutter/material.dart';

import 'package:wwu_wash_and_dry/widgets/login.dart';

void main() {
  // collect access key with a query to the current url
  var accessToken = (Uri.base.queryParameters['token']).toString();
  // collect error with a query to the current url
  final error = (Uri.base.queryParameters['error']).toString();

  // continue using localhost if you start on localhost
  // WARNING: this completely disables single sign on and all
  // of its features
  if (Uri.base.toString().contains('localhost')) {
    accessToken = 'This_token_has_no_features';
  }
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
  var _accessKey = "-1";
  var _errorState = false;
  void _updateState() {
    if (_accessKey == 'AuthFailed') {
      // if in error state, on function use, change state number
      // back to the Login page's state string
      setState(() {
        _accessKey = '-1';
      });
    } else {
      // if the login button is clicked try to launch single sign on
      setState(() {
        // change webpage to the single sign on site and if it fails change key to AuthFailed to trigger error page.
        html.window.open(
          'https://login.microsoftonline.com/d958f048-e431-4277-9c8d-ebfb75e7aa64/oauth2/v2.0/authorize?client_id=b011ad62-bda8-449f-99d3-519a3d973218&response_type=code&response_mode=query&scope=https://graph.microsoft.com/User.Read&redirect_uri=https://172.27.4.142:5000/login/callback',
          '_self',
        );
        _accessKey = 'AuthFailed';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // returns the correct widget, error, login, or home page
    // widgets depending on the accessKey
    // but sets access key depending on the queries for this websites
    // access key and error
    if (!_errorState) {
      if (widget.error != '') {
        _accessKey = 'AuthFailed';
        _errorState = true;
      } else if (widget.accessToken != '') {
        _accessKey = widget.accessToken;
      }
    }
    return Login(_accessKey, _updateState);
  }
}
