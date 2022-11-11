import 'package:flutter/material.dart';
import '../class/machine.dart';
import './drop_down_list.dart';
import '../class/temp_dorm_data.dart';

import 'floor_layout.dart';

// Implemented by Catherine Thomsen and Redesigned the UI

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
  static const _condardFloors = ['C1', 'C2', 'C3', 'C4'];
  static const String _forman = "Foreman";
  static const String _conard = "Conard";
  static const String _sittner = "Sittner";
  String floor = 'none';
  String building = 'none';
  List<Machine> currentDisplay = Sittner;
  String title = _sittner;
  String changeTitle = "";

  // Needs to pass in washers and dyers
  void updatePage(String selectedFloor, String selectedBuilding) {
    List<Machine> machines = [];
    var floor = 0;
    if (selectedBuilding == _sittner) {
      machines = Sittner;
      changeTitle = _sittner;
    } else if (selectedBuilding == _forman) {
      floor = int.parse(selectedFloor.substring(1)) - 2; // starts on 2nd
      machines = Foreman[floor];
      changeTitle = _forman;
    } else if (selectedBuilding == _conard) {
      floor = int.parse(selectedFloor.substring(1)) - 1; // starts on 1st
      machines = Conard[floor];
      changeTitle = _conard;
    }
    setState(() {
      currentDisplay = machines;
      title = changeTitle;
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
                        building = _sittner;
                        setState(() {
                          updatePage("S1", _sittner);
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  child: DropDownList(_forman, _foremanFloors, updatePage),
                ),
                Container(
                  child: DropDownList(_conard, _condardFloors, updatePage),
                ),
              ],
            ),
          ),
          Expanded(child: FloorLayout(machines: currentDisplay)),
        ],
      ),
    );
  }
}
