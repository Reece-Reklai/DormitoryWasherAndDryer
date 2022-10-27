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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                      margin: const EdgeInsets.all(15.0),
                      child: const Text("Login Error",
                      style: TextStyle(fontSize: 30),)
                    )
            ),
            Center(
              child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(150,50),
                        primary: Colors.lightGreen.shade900
                      ),
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
