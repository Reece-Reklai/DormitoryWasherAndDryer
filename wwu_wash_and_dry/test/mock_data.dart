import 'package:flutter/material.dart';
import 'package:wwu_wash_and_dry/widgets/drop_down_list.dart';

// 
class DDT {
  String selected = "";
  String found = "";

  void testFunction(String foundM, String selection) {
    selected = selection;
    found = foundM;
  }
}

class MockDropDownList extends StatelessWidget {
  MockDropDownList({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;
  final localFunction = DDT();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: DropDownList(
            message,
            const [
              "1",
              "2",
              "3",
            ],
            localFunction.testFunction,
          ),
        ),
      ),
    );
  }
}
