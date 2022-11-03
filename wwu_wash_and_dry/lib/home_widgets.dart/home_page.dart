import 'dart:developer';
import 'package:flutter/material.dart';

import './drop_down_list.dart';
import './dorm_data.dart';
import './machine.dart';
import '../floor_layout.dart';

// Implemented by Catherine Thomsen

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool floorChoosen = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DropDownMain());
  }
}

class DropDownMain extends StatefulWidget {
  const DropDownMain({super.key});

  @override
  State<DropDownMain> createState() => _DropDownMain();
}

class _DropDownMain extends State<DropDownMain> {
  static const _foremanFloors = ['F2', 'F3', 'F4', 'F5', 'F6', 'F7'];
  static const _condardFloors = ['C1', 'C2', 'C3', 'C4'];
  static const String _forman = "Foreman";
  static const String _conard = "Conard";
  static const String _sittner = "Sittner";
  String floor = 'none';
  String building = 'none';
  bool floorChoosen = false;

  // Needs to pass in washers and dyers
  void updatePage(String selectedFloor, String selectedBuilding) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FloorLayout(machines: Sittner)),
    );
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('WWU Wash and Dry'),
        ),
        body: Column(
          children: <Widget>[
            const Text(
              "Home Page",
              style: TextStyle(fontSize: 30),
            ),
            TextButton(
              onPressed: () => {
                building = _sittner,
                setState(() {
                  updatePage("S1", _sittner);
                })
              },
              child: const Text(
                _sittner,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            DropDownList(_forman, _foremanFloors, updatePage),
            DropDownList(_conard, _condardFloors, updatePage),
          ],
        ),
      );
  }
}
