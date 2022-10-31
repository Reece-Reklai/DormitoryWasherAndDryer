import 'package:flutter/material.dart';

// Created by Reece Reklai and Bradon Ladd


// Test data to get a mock up and running
List<String> washers = ["Washer 1", "Washer 2", "Washer 3", "Washer 4", "Washer 5", "Washer 6"];
List<Color> availability = [Colors.green, Colors.green, Colors.green, Colors.red, Colors.yellow, Colors.green];


// Dummy classes for washers and dryers
class Washer {
  String name = 'null';
  String availability = 'null';
}

class Dryer {
  String name = 'null';
  String availability = 'null';
}

// When the respective floor is clicked on the homepage, the class
// governing the homepage will dynamically generate a FloorLayout class
// and pass in the list of washers, dryers, their availability, and a reference
// to the self-report information(? maybe)
class FloorLayout extends StatefulWidget {
  FloorLayout({super.key, this.floor = ''});

  // UNIMPLEMENTED FLOOR INFORMATION
  // List<Washer>? washers;
  // List<Dryer>? dryers;
  String floor = '';

  @override
  State<FloorLayout> createState() => _FloorLayout();
}

class _FloorLayout extends State<FloorLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.floor),
        backgroundColor: const Color.fromARGB(255, 119, 150, 122),
      ),
      body: washerList(),
    );
  }

  Widget washerList() {
    return ListView.builder(
      itemCount: washers.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text(washers[i]),
          tileColor: availability[i],

          // This will open Team 2's self report widget when it is completed
          trailing: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MyColor(),
            ),
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => const AlertDialog(
                title: Text("Dummy Alert Dialog"),
              ),
            ),
            child: const Icon(Icons.report),
          ),
        );
      },
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
