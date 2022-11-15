import 'package:flutter/material.dart';
import '../class/machine.dart';
import './drop_down_list.dart';

// from Adam: I don't know how to make this work. wasn't part of this
//import '../class/temp_dorm_data.dart';

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
  static const String _foreman = "Foreman";
  static const String _conard = "Conard";
  static const String _sittner = "Sittner";

  // from Adam: I don't know how to make this work. wasn't part of this
  //List<Machine> currentDisplay = Sittner;
  String title = _sittner;

  // Needs to pass in washers and dyers
  void updatePage(String selectedFloor, String selectedBuilding) {
    List<Machine> machines = [];
    var floor = 0;
    if (selectedBuilding == _sittner) {
      // from Adam: I don't know how to make this work. wasn't part of this
      //machines = Sittner;
      title = _sittner;
    } else if (selectedBuilding == _foreman) {
      floor = int.parse(selectedFloor.substring(1)) - 2; // starts on 2nd
      // from Adam: I don't know how to make this work. wasn't part of this
      //machines = Foreman[floor];
      title = _foreman;
    } else if (selectedBuilding == _conard) {
      floor = int.parse(selectedFloor.substring(1)) - 1; // starts on 1st

      // from Adam: I don't know how to make this work. wasn't part of this
      //machines = Conard[floor];
      title = _conard;
    }
    setState(() {
      // from Adam: I don't know how to make this work. wasn't part of this
      //currentDisplay = machines;
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
          // from Adam: I don't know how to make this work. wasn't part of this
          //Expanded(child: FloorLayout(machines: currentDisplay)),
        ],
      ),
    );
  }
}
