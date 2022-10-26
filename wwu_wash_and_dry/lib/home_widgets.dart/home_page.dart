import 'dart:developer';
import 'package:flutter/material.dart';

import './drop_down_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _floorList = ['F1', 'F2', 'F3', 'F4', 'F5'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WWU Wash and Dry'),
        ),
        body: Container(
          margin: const EdgeInsets.all(2),
          child: Column(
            children: <Widget>[
              const Text("Home Page"),
              ElevatedButton(
                  onPressed: () => {log("Sittner Chosen!")},
                  child: const Text("Sittner")),
              const DropDownList(_floorList),
            ],
          ),
        ),
      ),
    );
  }
}
