import 'package:flutter/material.dart';

class LoginError extends StatelessWidget {
  final VoidCallback updateState;
  const LoginError(this.updateState, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WWU Wash and Dry'),
        ),
        body: Column(children: [
          const Text("Login Error"),
          ElevatedButton(
              onPressed: updateState, child: const Text('Return to login')),
        ]),
      ),
    );
  }
}
