// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import '../class/machine.dart';
import './drop_down_list.dart';
import '../class/temp_dorm_data.dart';
import "../class/floor.dart";

import 'floor_layout.dart';

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
    return const MaterialApp(
        home: DropDownMain(), debugShowCheckedModeBanner: false);
  }
}

class DropDownMain extends StatefulWidget {
  const DropDownMain({super.key});

  @override
  State<DropDownMain> createState() => _DropDownMain();
}

class _DropDownMain extends State<DropDownMain> {
  static const _foremanFloors = ['F2', 'F3', 'F4', 'F5', 'F6', 'F7'];
  static const _conardFloors = ['C1', 'C2', 'C3', 'C4'];
  static const String _forman = "Foreman";
  static const String _conard = "Conard";
  static const String _sittner = "Sittner";
  String floor = 'none';
  String building = 'none';
  bool floorChoosen = false;

  // mock Floor object
  Floor testFloor = Floor(1, ['test'], ['test']);

  // Needs to pass in washers and dyers
  void updatePage(String selectedFloor, String selectedBuilding) {
    List<Machine> machines = [];
    var floor = 0;
    if (selectedBuilding == _sittner) {
      machines = Sittner;
    } else if (selectedBuilding == _forman) {
      floor = int.parse(selectedFloor.substring(1)) - 2; // starts on 2nd
      machines = Foreman[floor];
    } else if (selectedBuilding == _conard) {
      floor = int.parse(selectedFloor.substring(1)) - 1; // starts on 1st
      machines = Conard[floor];
    }
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FloorLayout(
            machines: machines,
            floorObj: testFloor,
          ),
        )
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WWU Wash and Dry'),
        backgroundColor: const Color(0xFF656950),
      ),
      body: Container(
          color: const Color.fromARGB(255, 177, 177, 177),
          padding: const EdgeInsets.all(50),
          child: Material(
            elevation: 12,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(50),
                  child: const Text(
                    "Select a floor from the drop down menu",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextButton(
                    onPressed: () => {
                      building = _sittner,
                      setState(() {
                        updatePage("S1", _sittner);
                      })
                    },
                    child: const Text(
                      _sittner,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: DropDownList(_forman, _foremanFloors, updatePage),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: DropDownList(_conard, _conardFloors, updatePage),
                ),
              ],
            ),
          )),
    );
  }
}
