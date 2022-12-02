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
    return Scaffold(
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
                  child: GridView.builder(
                    itemCount: widget.floorObj.getWasherList.length,
                    padding: const EdgeInsets.all(30),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 10/1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (ctx, index) {
                      return Container(
                          color: getColor(widget.floorObj.getWasherList[index]),
                          height: 100,
                          margin: const EdgeInsets.all(4),
                          child: RoundedRectangleBorder (borderRadius: BorderRadius.circular(20.0),
                          ),
                          Text(
                            '${widget.floorObj.getWasherList[index].getType} ${widget.floorObj.getWasherList[index].getID}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )
                          // child: Container(
                          //   height: 100,
                          //   color: getColor(widget.floorObj.getWasherList[index]),
                          //   child: Text(
                          //     '${widget.floorObj.getWasherList[index].getType} ${widget.floorObj.getWasherList[index].getID}',
                          //     style: const TextStyle(
                          //       color: Colors.white,
                          //     ),
                          //   ),

                          // '${widget.floorObj.getDryerList} ${widget.machines[i].getID}')

                          // This will open Team 2's self report widget when it is completed
                          // trailing: ElevatedButton(
                          //   style: const ButtonStyle(
                          //     backgroundColor: MyColor(),
                          //   ),
                          //   onPressed: () => showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) =>
                          //         const AlertDialog(
                          //       title: Text('Dummy Alert Dialog'),
                          //     ),
                          //   ),
                          //   child: const Icon(Icons.report),
                          // ),
                          // ),
                          );
                    },
                  ),
                ),
              ],
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
