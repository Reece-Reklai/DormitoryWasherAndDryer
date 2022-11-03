# WWU Wash and Dry Widgets

## Home Page
* `lib/home.dart` - Manages single sign on and presents user with sign on page, an error page, or moves on to the home page.
## Home page widgets
*(found under lib/home_widgets)*
* `dorm_data.dart` - Temp list of data to be converted to classes
* `drop_down_list.dart` - Drop down that displays lists of floors with the name of the building showing. Calls passed in function on selection of floor passing back the floor and building tag.
* `home_page.dart` - Displays selection for all the dorms (Sittner, Conard, and Foreman). These are either in drop down form or from a button press.
* `login_error.dart` - Displays a login error, calls passed in function
* `login_page.dart` - Displays login, calls passed in function
* `login.dart` - Selects page to display based on user authentication 
* `machine.dart` - Machine class with information about a specific machine
## Popups
* `popup.dart` - Displays popups for washer/dryer selection
## Floor Layout
* `floor_layout.dart` - Displays floor layout for machines. Calls self reporting widget
