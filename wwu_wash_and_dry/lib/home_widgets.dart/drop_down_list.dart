import 'package:flutter/material.dart';
// Implemented by Catherine Thomsen

// dropDown menu example
// https://flutterforyou.com/how-to-add-dropdown-menu-in-flutter/
// https://www.flutterbeads.com/dropdown-in-flutter/
class DropDownList extends StatelessWidget {
  final List<String> floorList;
  final String title;
  final Function floorChosen;
  const DropDownList(this.title, this.floorList, this.floorChosen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(
            title,
            style: const TextStyle(fontSize: 30, color: Colors.black),
          ),
          // value: dropdownValue,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          items: floorList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 30),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            floorChosen(newValue, title);
          },
        ),
      ),
    );
  }
}
