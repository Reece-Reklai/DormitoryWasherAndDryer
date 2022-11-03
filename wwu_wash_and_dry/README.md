# WWU Wash and Dry

## Brief Description of the Application


## test
login_test.dart
    - testWidgets
        - Login returns a Login_Page on recieving -1 or AuthFailed
        - Login returns a Login_Page on recieving AuthFailed
        - Login returns a Login_Page on recieving any other value
        - Error Page button press takes you to Login
        - Login Page Button takes you to Home

## Home
home.dart 
    - manages single sign on and presents user with sign on page, an error page, or moves on to the home page.
### home_widgets.dart
dorm_data 
    - temp list of data to be converted to classes
drop_down_list.dart 
    - drop down that displays lists of floors with the name of the building showing. Calls passed in function on selection of floor passing back the floor and building tag.
home_page.dart 
    - Displays selection for all the dorms (Sittner, Conard, and Foreman). These are either in drop down form or from a button press.
login_error.dart 
    - Displays a login error, calls passed in function
login_page.dart 
    - Displays login, calls passed in function
login.dart 
    - selects page to display based on user authentication 
machine.dart 
    - machine class with information about a specific machine

### floor-layout.dart
FloorLayout Function
    - takes in the arguments from the machine class (required machine itself, optional machine floor variable, optional building variable)
    - create a list of machines
    - it extends to the _FloorLayout function
_FloorLayout function
    - Has a mock that tests what the machine's current status is and returns the associated color (green, yellow, red)
    - it builds a listview that contains the following:
        - displays a color behind the text associating with the machines current color
        - displays a text containing the machine name, number
        - displays a self report button as a warning icon
            - once pressed, it shows a dummy alert dialog
