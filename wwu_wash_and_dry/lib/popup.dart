import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final int _count = 0;

  @override
  Widget build(BuildContext context) {
    var number = 2;
    var status = 'Avalible';
    var time = 120;
    var readable = intToTimeLeft(time);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Center(child: Text('You have pressed the button $_count times.')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: Text('Washer $number'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  //position
                  mainAxisSize: MainAxisSize.min,
                  // wrap content in flutter
                  children: <Widget>[
                    Text('Status: $status'),
                    Text('Time: $readable'),
                  ],
                ),
                actions: [
                  Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: TextButton(
                        onPressed: (() => Navigator.pop(context)),
                        child: const Text('OK'),
                      )),
                ]),
          );
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}

//https://dev.to/devlonoah/convert-integer-value-to-hour-minute-seconds-in-dart-48hc
String intToTimeLeft(int value) {
  int h, m, s;

  h = value ~/ 3600;

  m = ((value - h * 3600)) ~/ 60;

  s = value - (h * 3600) - (m * 60);

  String hourLeft = h.toString().length < 2 ? "0" + h.toString() : h.toString();

  String minuteLeft =
      m.toString().length < 2 ? "0" + m.toString() : m.toString();

  String secondsLeft =
      s.toString().length < 2 ? "0" + s.toString() : s.toString();

  String result = "$minuteLeft:$secondsLeft";

  return result;
}
