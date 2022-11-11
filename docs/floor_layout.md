# The floor_layout class was implemented by Bradon Ladd and Reece Reklai

This class represents the page users are sent to after choosing what floor they want to display. It grabs information from an API call and organizes the data in a way that users can interact with it.

FloorLayout({super.key, required this.machines, this.floor = '', this.building = ''}) => createState => _FloorLayout()
- String building = '';
- String floor = '';
- final List<Machine> machines;

_FloorLayout():
- Color getColor(Machine machine): Grabs the colors of a passed in machine. Used by the ListView.builder to dynamically assign tile colors based on the status of the machine
- Widget build(BuildContext build): Returns a Scaffold containing all relevant widgets. The body is made up of a Container, which holds a Material, which holds a Container, and finally a Column that has four widgets: Washer Title, Washer List, Dryer Title, Dryer List. Each Tile has a popup dialog button that users click to recieve more detailed information.

MyColor extends MaterialStateColor():
- _defaultColor
- _pressedColor
- This class simply governs the colors of the popup dialog buttons on the ListTiles.