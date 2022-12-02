import 'package:flutter/material.dart';
import 'package:wwu_wash_and_dry/class/floor.dart';
import 'package:wwu_wash_and_dry/class/machine.dart';
// Created by Reece Reklai and Bradon Ladd

// When the respective floor is clicked on the homepage, the class
// governing the homepage will dynamically generate a FloorLayout class
// and pass in the list of washers, dryers, their availability, and a reference
// to the self-report information(? maybe)
// ignore: must_be_immutable
class FloorLayout extends StatefulWidget {
  FloorLayout({super.key, required this.floorObj, this.building = ''});

  String building = '';
  String floor = '';

  final Floor floorObj;

  @override
  State<FloorLayout> createState() => _FloorLayout();
}

// Widget that dynamically displays the machine list
class _FloorLayout extends State<FloorLayout> {
  Color getColor(Machine machine) {
    if (machine.getStatus() == 'AVAL') {
      return const Color.fromARGB(255, 0, 169, 69);
    } else if (machine.getStatus() != 'AVAL') {
      return const Color.fromARGB(255, 216, 70, 84);
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(24),
          color: const Color.fromARGB(255, 177, 177, 177),
          child: Material(
            elevation: 12,
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: const Text(
                      'Washers',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.floorObj.getWasherList.length,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: const EdgeInsets.all(4),
                          child: Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            elevation: 6,
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              title: Text(
                                '${widget.floorObj.getWasherList[i].getType} ${widget.floorObj.getWasherList[i].getID}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              tileColor:
                                  getColor(widget.floorObj.getWasherList[i]),
                                  
                              // This will open Team 2's self report widget when it is completed
                              onLongPress: () => {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      const AlertDialog(
                                    title: Text('Dummy Alert Dialog'),
                                  ),
                                ),
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: const Text(
                      'Dryers',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.floorObj.getDryerList.length,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: const EdgeInsets.all(4),
                          child: Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            elevation: 6,
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              title: Text(
                                '${widget.floorObj.getDryerList[i].getType} ${widget.floorObj.getDryerList[i].getID}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              tileColor:
                                  getColor(widget.floorObj.getDryerList[i]),

                              // This will open Team 2's self report widget when it is completed
                              onLongPress: () => {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      const AlertDialog(
                                    title: Text('Dummy Alert Dialog'),
                                  ),
                                ),
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyColor extends MaterialStateColor {
  const MyColor() : super(_defaultColor);

  static const int _defaultColor = 0xFF000000;
  static const int _pressedColor = 0xFF77967A;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return const Color(_pressedColor);
    }
    return const Color(_defaultColor);
  }
}
