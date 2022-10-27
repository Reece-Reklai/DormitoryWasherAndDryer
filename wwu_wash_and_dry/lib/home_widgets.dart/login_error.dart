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
          backgroundColor: Colors.lightGreen.shade900
        ),
        body: Column(
          // allign the button and text to the center of the column
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // allign the button and text to the center of the screen
            Center(
              child: Container(
                      margin: const EdgeInsets.all(15.0),
                      child: const Text("Login Error",
                      style: const TextStyle(fontSize: 30),)
                    )
            ),
            Center(
              child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150,50),
                        primary: Colors.lightGreen.shade900
                      ),
                      // on button press update the state back to the
                      // login state
                      onPressed: updateState,
                      child: const Text('Return to login'),
                    ) 
            ),
          ]
        ),
      ),
    );
  }
}
