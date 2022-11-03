import 'package:flutter/material.dart';

class LoginError extends StatelessWidget {
  final VoidCallback _updateState;
  const LoginError(this._updateState, {super.key});

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
            const Text(
              "Uh oh! There seems to have been an error",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _updateState,
              style: TextButton.styleFrom(
                fixedSize: const Size.fromHeight(40.0),
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightGreen.shade900,
              ),
              child: const Text('Return to login page'),
            )
          ],
        )),
      ),
    );
  }
}
