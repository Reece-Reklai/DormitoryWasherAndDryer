# WWU Wash and Dry Widgets

## Home
`lib/home.dart` - manages single sign on and presents user with sign on page, an error page, or moves on to the home page.
### lib/home_widgets.dart
* `dorm_data` - temp list of data to be converted to classes
* `drop_down_list.dart` - drop down that displays lists of floors with the name of the building showing. Calls passed in function on selection of floor passing back the floor and building tag.
* `home_page.dart` - Displays selection for all the dorms (Sittner, Conard, and Foreman). These are either in drop down form or from a button press.
* `login_error.dart` - Displays a login error, calls passed in function
* `login_page.dart` - Displays login, calls passed in function
* `login.dart` - selects page to display based on user authentication 
* `machine.dart` - machine class with information about a specific machine
