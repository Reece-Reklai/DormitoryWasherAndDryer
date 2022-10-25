import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  const DropDownList({super.key});

  @override
  State<DropDownList> createState() => _DropDownListState();
}

// dropDown menu example
// https://flutterforyou.com/how-to-add-dropdown-menu-in-flutter/
class _DropDownListState extends State<DropDownList> {
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton(
          value: selectedValue,
          items: const [
            DropdownMenuItem(
              value: 1,
              child: Text("F1"),
            ),
            DropdownMenuItem(
              value: 2,
              child: Text("F2"),
            ),
            DropdownMenuItem(
              value: 3,
              child: Text("F3"),
            )
          ],
          onChanged: (value) {
            setState(() {
              selectedValue = value as int;
            });
          }),
    );
  }
}
