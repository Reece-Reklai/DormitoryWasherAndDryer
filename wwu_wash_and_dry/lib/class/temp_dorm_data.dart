import 'machine.dart';

// data for dorms, Note the lists are just brain storming.
// I am going to make them into classes with this data embeded eventually.
// List<Map<String, Object>>
// 'id': int, 'type': 'Washer':'Dryer', 'floor': 'S':'F*':'C*'
var Sittner = [
  Machine('1', 'Washer', "AVAL", true),
  Machine('2', 'Washer', "AVAL", true),
  Machine('3', 'Washer', "AVAL", true),
  Machine('4', 'Washer', "AVAL", true),
  Machine('5', 'Washer', "AVAL", true),
  Machine('6', 'Washer', "AVAL", true),
  Machine('7', 'Washer', "AVAL", true),
  Machine('8', 'Washer', "AVAL", true),
  Machine('9', 'Washer', "AVAL", true),
  Machine('10', 'Washer', "AVAL", true),
  Machine('11', 'Washer', "AVAL", true),
  Machine('12', 'Washer', "AVAL", true),
  Machine('13', 'Washer', "AVAL", true),
  // {'id': 2, 'type': 'Washer', 'floor': 'S'},
  // {'id': 3, 'type': 'Washer', 'floor': 'S'},
  // {'id': 4, 'type': 'Washer', 'floor': 'S'},
  // {'id': 5, 'type': 'Washer', 'floor': 'S'},
  // {'id': 6, 'type': 'Washer', 'floor': 'S'},
  // {'id': 7, 'type': 'Washer', 'floor': 'S'},
  // {'id': 8, 'type': 'Washer', 'floor': 'S'},
  // {'id': 9, 'type': 'Washer', 'floor': 'S'},
  // {'id': 10, 'type': 'Washer', 'floor': 'S'},
  // {'id': 1, 'type': 'Dryer', 'floor': 'S'},
  // {'id': 2, 'type': 'Dryer', 'floor': 'S'},
  // {'id': 3, 'type': 'Dryer', 'floor': 'S'},
  // {'id': 4, 'type': 'Dryer', 'floor': 'S'},
  // {'id': 5, 'type': 'Dryer', 'floor': 'S'},
  // {'id': 6, 'type': 'Dryer', 'floor': 'S'},
  // {'id': 7, 'type': 'Dryer', 'floor': 'S'},
  // {'id': 8, 'type': 'Dryer', 'floor': 'S'},
  // {'id': 9, 'type': 'Dryer', 'floor': 'S'},
  // {'id': 10, 'type': 'Dryer', 'floor': 'S'},
];
// List<List<Map<String, Object>>>
var Foreman = [
  [
    Machine('11', 'Washer', "AVAL", true),
    // {'id': 11, 'type': 'Washer', 'floor': 'F2'},
    // {'id': 11, 'type': 'Dryer', 'floor': 'F2'},
  ],
  [
    Machine('12', 'Washer', "AVAL", true),
    Machine('13', 'Washer', "AVAL", true),
    // {'id': 12, 'type': 'Washer', 'floor': 'F3'},
    // {'id': 13, 'type': 'Washer', 'floor': 'F3'},
    // {'id': 12, 'type': 'Dryer', 'floor': 'F3'},
    // {'id': 13, 'type': 'Dryer', 'floor': 'F3'},
  ],
  [
    Machine('14', 'Washer', "AVAL", true),
    Machine('15', 'Washer', "AVAL", true),
    // {'id': 14, 'type': 'Washer', 'floor': 'F4'},
    // {'id': 15, 'type': 'Washer', 'floor': 'F4'},
    // {'id': 14, 'type': 'Dryer', 'floor': 'F4'},
    // {'id': 15, 'type': 'Dryer', 'floor': 'F4'},
  ],
  [
    Machine('16', 'Washer', "AVAL", true),
    Machine('17', 'Washer', "AVAL", true),
    // {'id': 16, 'type': 'Washer', 'floor': 'F5'},
    // {'id': 17, 'type': 'Washer', 'floor': 'F5'},
    // {'id': 16, 'type': 'Dryer', 'floor': 'F5'},
    // {'id': 17, 'type': 'Dryer', 'floor': 'F5'},
  ],
  [
    Machine('18', 'Washer', "AVAL", true),
    Machine('19', 'Washer', "AVAL", true),
    // {'id': 18, 'type': 'Washer', 'floor': 'F6'},
    // {'id': 19, 'type': 'Washer', 'floor': 'F6'},
    // {'id': 18, 'type': 'Dryer', 'floor': 'F6'},
    // {'id': 19, 'type': 'Dryer', 'floor': 'F6'},
  ],
  [
    Machine('20', 'Washer', "AVAL", true),
    Machine('21', 'Washer', "AVAL", true),
    // {'id': 20, 'type': 'Washer', 'floor': 'F7'},
    // {'id': 21, 'type': 'Washer', 'floor': 'F7'},
    // {'id': 20, 'type': 'Dryer', 'floor': 'F7'},
    // {'id': 21, 'type': 'Dryer', 'floor': 'F7'},
  ],
];
var Conard = [
  [
    Machine('22', 'Washer', "AVAL", true),
    Machine('23', 'Washer', "AVAL", true),
    Machine('24', 'Washer', "AVAL", true),
    // {'id': 22, 'type': 'Washer', 'floor': 'C1'},
    // {'id': 23, 'type': 'Washer', 'floor': 'C1'},
    // {'id': 24, 'type': 'Washer', 'floor': 'C1'},
    // {'id': 22, 'type': 'Dryer', 'floor': 'C1'},
    // {'id': 23, 'type': 'Dryer', 'floor': 'C1'},
    // {'id': 24, 'type': 'Dryer', 'floor': 'C1'},
  ],
  [
    Machine('25', 'Washer', "AVAL", true),
    // {'id': 25, 'type': 'Washer', 'floor': 'C2'},
    // {'id': 25, 'type': 'Dryer', 'floor': 'C2'},
  ],
  [
    Machine('26', 'Washer', "AVAL", true),
    // {'id': 26, 'type': 'Washer', 'floor': 'C3'},
    // {'id': 26, 'type': 'Dryer', 'floor': 'C3'},
  ],
  [
    Machine('27', 'Washer', "AVAL", true),
    // {'id': 27, 'type': 'Washer', 'floor': 'C4'},
    // {'id': 27, 'type': 'Dryer', 'floor': 'C4'},
  ],
];
