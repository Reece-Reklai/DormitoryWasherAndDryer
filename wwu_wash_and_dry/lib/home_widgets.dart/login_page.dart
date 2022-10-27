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
          backgroundColor: Colors.lightGreen.shade900,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [

            const Text("WWU Wash and Dry Login",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),

            const SizedBox(height: 25),

            TextButton(
              onPressed: () => {log("Login Button Pressed!")},
              style: TextButton.styleFrom(
                fixedSize: const Size.fromHeight(75.0),
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightGreen.shade900,
              ),
              child: const Text(
                'Login Using WWU Account',
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
