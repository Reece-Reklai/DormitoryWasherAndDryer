import 'package:flutter/material.dart';

import './home_widgets.dart/home_page.dart';
import './home_widgets.dart/login_error.dart';
import './home_widgets.dart/login.dart';
import './home_widgets.dart/login_page.dart';

void main() {
  runApp(const WWUApp());
}

class WWUApp extends StatefulWidget {
  const WWUApp({super.key});

  @override
  State<WWUApp> createState() => _WWUAppState();
}

class _WWUAppState extends State<WWUApp> {
  var accessKey = "-1";
  @override
  Widget build(BuildContext context) {
    return Login(acessKey)
}
