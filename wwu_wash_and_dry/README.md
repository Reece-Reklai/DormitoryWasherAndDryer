# WWU Wash and Dry

## Brief Description of the Application


## Test
* `login_test.dart ` 
    - testWidgets
        - Login returns a Login_Page on receiving -1 or AuthFailed
        - Login returns a Login_Page on receiving AuthFailed
        - Login returns a Login_Page on receiving any other value
        - Error Page button press takes you to Login
        - Login Page Button takes you to Home
* `test_building.dart`
    - 

## Home Page
* `lib/home.dart` 
    - manages single sign on and presents user with sign on page, an error page, or moves on to the home page.

## Home page widgets
* `dorm_data.dart` 
    - temp list of data to be converted to classes
* `drop_down_list.dart` 
    - drop down that displays lists of floors with the name of the building showing. Calls passed in function on selection of floor passing back the floor and building tag.
* `home_page.dart`
    - Displays selection for all the dorms (Sittner, Conard, and Foreman). These are either in drop down form or from a button press.
* `login_error.dart`
    - Displays a login error, calls passed in function
* `login_page.dart`
    - Displays login, calls passed in function
* `login.dart`
    - selects page to display based on user authentication 
* `machine.dart`
    - machine class with information about a specific machine

## Popups
* `popup.dart` - Displays popups for washer/dryer selection

## Floor Layout
* `floor_layout.dart` - Displays floor layout for machines. Calls self reporting widget
* `FloorLayout Function`
    - takes in the arguments from the machine class (required machine itself, optional machine floor variable, optional building variable)
    - create a list of machines
    - it extends to the _FloorLayout function
* `_FloorLayout function`
    - Has a mock that tests what the machine's current status is and returns the associated color (green, yellow, red)
    - it builds a list view that contains the following:
        - displays a color behind the text associating with the machines current color
        - displays a text containing the machine name, number
        - displays a self report button as a warning icon
            - once pressed, it shows a dummy alert dialog

## Packages

1. `https://pub.dev/packages/mocktail`
2. `https://pub.dev/packages/equatable#recap1`
3. `https://pub.dev/packages/linter`

## Google Documentation

1. `https://docs.google.com/document/d/1mFKdUnApCGj03VzCBk_2pUWTvLkUo0n02TE1V_2-VBs/edit?usp=sharing`