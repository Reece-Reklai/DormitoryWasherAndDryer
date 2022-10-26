import 'package:flutter/material.dart';
import 'package:wwu_wash_and_dry/home_widgets.dart/home_page.dart';
import 'package:wwu_wash_and_dry/home_widgets.dart/login_error.dart';
import 'package:wwu_wash_and_dry/home_widgets.dart/login_page.dart';

class Login extends StatelessWidget {
  /// used for returning a corresponding widget depending on a String accessKey
  final String accessKey;
  final VoidCallback updateState;
  const Login(this.accessKey, this.updateState, {super.key});

  @override
  Widget build(BuildContext context) {
    /// returns a corresponding widget depending on accessKey
    if (accessKey == "-1") {
      return const LoginPage();
    } else if (accessKey == "AuthFailed") {
      return LoginError(updateState);
    } else {
      return const HomePage();
    }
  }
}
