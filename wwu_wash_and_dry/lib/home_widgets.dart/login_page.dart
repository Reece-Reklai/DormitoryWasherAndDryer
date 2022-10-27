import 'package:flutter/material.dart';
import 'dart:developer';

import 'login_page.dart';
import 'login_error.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WWU Wash and Dry'),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("WWU Wash and Dry Login"),
            TextButton(
              onPressed: () => {log("Login Button Pressed!")},
              style: TextButton.styleFrom(
                fixedSize: const Size.fromHeight(75.0),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Login Using WWU Account',
                // style: TextStyle(fontSize: 30.0),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
