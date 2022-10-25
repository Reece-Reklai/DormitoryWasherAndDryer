import 'package:flutter/material.dart';

class LoginError extends StatelessWidget {
  const LoginError({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WWU Wash and Dry'),
        ),
        body: Container(
          child: Text("Login Error"),
        ),
      ),
    );
  }
}
