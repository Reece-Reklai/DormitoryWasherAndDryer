import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  final List<String> floorList;
  final String title;
  const DropDownList(this.title, this.floorList, {super.key});

  @override
  State<DropDownList> createState() => _DropDownListState();
}

// dropDown menu example
// https://flutterforyou.com/how-to-add-dropdown-menu-in-flutter/
// https://www.flutterbeads.com/dropdown-in-flutter/
class _DropDownListState extends State<DropDownList> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    String dropdownValue = widget.floorList[selectedValue];
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(
            widget.title,
            style: const TextStyle(fontSize: 30, color: Colors.black),
          ),
          // value: dropdownValue,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
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
              selectedValue =
                  widget.floorList.indexWhere((element) => element == newValue);
            });
          },
        ),
      ),
    );
  }
}
