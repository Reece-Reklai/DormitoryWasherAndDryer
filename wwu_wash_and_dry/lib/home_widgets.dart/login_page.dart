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
          // alignment
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            const Text("WWU Wash and Dry Login"),
            TextButton(
              onPressed: () => {log("Login Button Pressed!")},
              style: TextButton.styleFrom(
                fixedSize: Size.fromHeight(75),
                primary: Colors.white,
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Login Using WWU Account',
                // style: TextStyle(fontSize: 30.0),
              ),
            ),
          ]
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // children: <Widget> [
          //   TextButton(
          //     onPressed: () => {log("Login Button Pressed!")},
          //     style: TextButton.styleFrom(
          //       primary: Colors.white,
          //       backgroundColor: Colors.blue
          //     ),
          //     child: const Text(
          //       'Login Using WWU Account',
          //       style: TextStyle(fontSize: 30.0),
          //     ),
          //   ),
          // ],
        ),
        
        // body: Center (
        //   margin: EdgeInsets.all(25),
        //   child: FlatButton(
        //     child: Text("Sign In", style: TextStyle(fontSize: 20.0),),
        //     onPressed: (){},
        //   ),
        // )
      ),
    );
  }
}
