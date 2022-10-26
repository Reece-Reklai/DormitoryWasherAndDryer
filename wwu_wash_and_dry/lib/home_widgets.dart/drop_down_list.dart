import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  final List<String> floorList;
  const DropDownList(this.floorList, {super.key});

  @override
  State<DropDownList> createState() => _DropDownListState();
}

// dropDown menu example
// https://flutterforyou.com/how-to-add-dropdown-menu-in-flutter/
// https://www.flutterbeads.com/dropdown-in-flutter/
class _DropDownListState extends State<DropDownList> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    String dropdownValue = widget.floorList[selectedValue];
    return Center(
      child: DropdownButton<String>(
        value: dropdownValue,
        items: widget.floorList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontSize: 30),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            dropdownValue = newValue as String;
          });
        },
      ),
    );
  }
}
