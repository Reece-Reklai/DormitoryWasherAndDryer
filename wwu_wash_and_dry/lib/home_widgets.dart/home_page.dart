import 'dart:developer';
import 'package:flutter/material.dart';

import './drop_down_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _foremanFloors = ['F2', 'F3', 'F4', 'F5', 'F6', 'F7'];
  static const _condardFloors = ['C1', 'C2', 'C3', 'C4'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WWU Wash and Dry'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              const Text(
                "Home Page",
                style: TextStyle(fontSize: 30),
              ),
              TextButton(
                onPressed: () => {log("Sittner Chosen!")},
                child: const Text(
                  "Sittner",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              DropDownList("Foreman", _foremanFloors),
              DropDownList("Conard", _condardFloors),
            ],
          ),
        ),
      ),
    );
  }
}
