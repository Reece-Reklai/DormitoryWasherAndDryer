import 'package:flutter/material.dart';
import 'package:wwu_wash_and_dry/widgets/home_page.dart';
import 'package:wwu_wash_and_dry/widgets/login_error.dart';
import 'package:wwu_wash_and_dry/widgets/login_page.dart';

class Login extends StatelessWidget {
  /// used for returning a corresponding widget depending on a String accessKey
  final String _accessKey;
  final VoidCallback _updateState;
  const Login(this._accessKey, this._updateState, {super.key});

  @override
  Widget build(BuildContext context) {
    /// returns a corresponding widget depending on accessKey
    if (_accessKey == '-1') {
      return LoginPage(_updateState);
    } else if (_accessKey == 'AuthFailed') {
      return LoginError(_updateState);
    } else {
      // any keys that aren't failure or the login -1 page are valid
      return HomePage(_accessKey);
    }
  }
}
