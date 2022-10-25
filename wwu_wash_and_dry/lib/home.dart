import 'package:flutter/material.dart';

import './home_widgets.dart/login.dart';

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
  var accessKey = "-1";
  @override
  Widget build(BuildContext context) {
    return Login(accessKey);
  }
}
