import 'package:flutter/material.dart';

import 'login_page.dart';
import 'login_error.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (key === "AuthFailed") {
      return HomePage();
    }
  }
}
