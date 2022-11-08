import 'machine.dart';

// data for dorms, Note the lists are just brain storming.
// I am going to make them into classes with this data embeded eventually.
// List<Map<String, Object>>
// 'id': int, 'type': 'Washer':'Dryer', 'floor': 'S':'F*':'C*'
var Sittner = [
  Machine('1', 'Washer', 'S'),
  Machine('2', 'Washer', 'S'),
  Machine('3', 'Washer', 'S'),
  Machine('4', 'Washer', 'S'),
  Machine('5', 'Washer', 'S'),
  Machine('6', 'Washer', 'S'),
  Machine('7', 'Washer', 'S'),
  Machine('8', 'Washer', 'S'),
  Machine('9', 'Washer', 'S'),
  Machine('10', 'Washer', 'S'),
  Machine('11', 'Washer', 'S'),
  Machine('12', 'Washer', 'S'),
  Machine('13', 'Washer', 'S'),
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
const Foreman = [
  [
    {'id': 11, 'type': 'Washer', 'floor': 'F2'},
    {'id': 11, 'type': 'Dryer', 'floor': 'F2'},
  ],
  [
    {'id': 12, 'type': 'Washer', 'floor': 'F3'},
    {'id': 13, 'type': 'Washer', 'floor': 'F3'},
    {'id': 12, 'type': 'Dryer', 'floor': 'F3'},
    {'id': 13, 'type': 'Dryer', 'floor': 'F3'},
  ],
  [
    {'id': 14, 'type': 'Washer', 'floor': 'F4'},
    {'id': 15, 'type': 'Washer', 'floor': 'F4'},
    {'id': 14, 'type': 'Dryer', 'floor': 'F4'},
    {'id': 15, 'type': 'Dryer', 'floor': 'F4'},
  ],
  [
    {'id': 16, 'type': 'Washer', 'floor': 'F5'},
    {'id': 17, 'type': 'Washer', 'floor': 'F5'},
    {'id': 16, 'type': 'Dryer', 'floor': 'F5'},
    {'id': 17, 'type': 'Dryer', 'floor': 'F5'},
  ],
  [
    {'id': 18, 'type': 'Washer', 'floor': 'F6'},
    {'id': 19, 'type': 'Washer', 'floor': 'F6'},
    {'id': 18, 'type': 'Dryer', 'floor': 'F6'},
    {'id': 19, 'type': 'Dryer', 'floor': 'F6'},
  ],
  [
    {'id': 20, 'type': 'Washer', 'floor': 'F7'},
    {'id': 21, 'type': 'Washer', 'floor': 'F7'},
    {'id': 20, 'type': 'Dryer', 'floor': 'F7'},
    {'id': 21, 'type': 'Dryer', 'floor': 'F7'},
  ],
];
const Conard = [
  [
    {'id': 22, 'type': 'Washer', 'floor': 'C1'},
    {'id': 23, 'type': 'Washer', 'floor': 'C1'},
    {'id': 24, 'type': 'Washer', 'floor': 'C1'},
    {'id': 22, 'type': 'Dryer', 'floor': 'C1'},
    {'id': 23, 'type': 'Dryer', 'floor': 'C1'},
    {'id': 24, 'type': 'Dryer', 'floor': 'C1'},
  ],
  [
    {'id': 25, 'type': 'Washer', 'floor': 'C2'},
    {'id': 25, 'type': 'Dryer', 'floor': 'C2'},
  ],
  [
    {'id': 26, 'type': 'Washer', 'floor': 'C3'},
    {'id': 26, 'type': 'Dryer', 'floor': 'C3'},
  ],
  [
    {'id': 27, 'type': 'Washer', 'floor': 'C4'},
    {'id': 27, 'type': 'Dryer', 'floor': 'C4'},
  ],
];
