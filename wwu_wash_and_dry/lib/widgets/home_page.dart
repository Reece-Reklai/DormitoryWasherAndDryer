// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:wwu_wash_and_dry/class/dorm_data.dart';
import 'package:wwu_wash_and_dry/class/floor.dart';
import 'package:wwu_wash_and_dry/widgets/drop_down_list.dart';
import 'package:wwu_wash_and_dry/widgets/floor_layout.dart';

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
  static const String _foreman = 'Foreman';
  static const String _conard = 'Conard';
  static const String _sittner = 'Sittner';

  Floor currentDisplay = Floor(0, sittner[0], sittner[1]);
  String title = '${_sittner} F1';

  // Needs to pass in washers and dyers
  void updatePage(String selectedFloor, String selectedBuilding) {
    List<List<String>> machines = [];
    var floor = 0;
    if (selectedBuilding == _sittner) {
      machines = sittner;
      title = '${_sittner} F1';
    } else if (selectedBuilding == _foreman) {
      floor = int.parse(selectedFloor.substring(1)) - 2; // starts on 2nd
      machines = foreman[floor];
      title = '${_foreman} F${floor + 2}';
    } else if (selectedBuilding == _conard) {
      floor = int.parse(selectedFloor.substring(1)) - 1; // starts on 1st

      machines = conard[floor];
      title = '${_conard} C${floor + 1}';
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
                  child: DropDownList(_conard, _condardFloors, updatePage),
                ),
                Container(
                  child: DropDownList(_foreman, _foremanFloors, updatePage),
                ),
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
                          updatePage('S1', _sittner);
                        });
                      },
                    ),
                  ),
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
