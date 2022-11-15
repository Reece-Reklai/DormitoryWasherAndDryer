import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback _updateState;
  const LoginPage(this._updateState, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WWU Wash and Dry'),
          backgroundColor: Colors.lightGreen.shade900,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'WWU Wash and Dry Login',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            TextButton(
              onPressed: _updateState,
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
