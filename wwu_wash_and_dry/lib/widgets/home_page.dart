import 'package:flutter/material.dart';
import '../class/machine.dart';
import './drop_down_list.dart';

import '../class/dorm_data.dart';
import "../class/floor.dart";

import 'floor_layout.dart';

// Implemented by Catherine Thomsen and Reece Redesigned the UI

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
      home: DropDownMain(),
      debugShowCheckedModeBanner: false,
    );
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
  static const String _foreman = "Foreman";
  static const String _conard = "Conard";
  static const String _sittner = "Sittner";

  Floor currentDisplay = Floor(0, Sittner[0], Sittner[1]);
  String title = _sittner;

  // Needs to pass in washers and dyers
  void updatePage(String selectedFloor, String selectedBuilding) {
    List<List<String>> machines = [];
    var floor = 0;
    if (selectedBuilding == _sittner) {
      machines = Sittner;
      title = _sittner;
    } else if (selectedBuilding == _foreman) {
      floor = int.parse(selectedFloor.substring(1)) - 2; // starts on 2nd
      machines = Foreman[floor];
      title = _foreman;
    } else if (selectedBuilding == _conard) {
      floor = int.parse(selectedFloor.substring(1)) - 1; // starts on 1st

      machines = Conard[floor];
      title = _conard;
    }

    final Floor floorObj = Floor(floor, machines[0], machines[1]);

    setState(() {
      currentDisplay = floorObj;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        backgroundColor: const Color(0xFF656950),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Row(
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: FractionalOffset.topCenter,
                    child: TextButton(
                      child: const Text(
                        _sittner,
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      onPressed: () {
                        setState(() {
                          updatePage("S1", _sittner);
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  child: DropDownList(_foreman, _foremanFloors, updatePage),
                ),
                Container(
                  child: DropDownList(_conard, _condardFloors, updatePage),
                ),
              ],
            ),
          ),
          Expanded(child: FloorLayout(floorObj: currentDisplay)),
        ],
      ),
    );
  }
}
