//****************************************************************************
// home.dart - The home page displayed when the default route is navigated
//
// Boise State University CS 402
// Dr. Henderson
// Homework 4
//
// This widget will display the user's balance in the base currency, a button
// to make deposits, and a list of current purchased items (and their count).
//
// This widget will be displayed whenever the default '/' route is selected
//----------------------------------------------------------------------------
import 'package:flutter/material.dart';

// TODO: Create a stateless widget to display the home page. (30 pts)
// In your build method, you will need to get the Bank instance by calling Bank.of(context). Once you have it
// Your widget should implement the UI as described in the README.md
// When the user presses the [deposit] button your app should call the helper method _depositDialog()
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Home Page",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            ],
          ),
        ),
      ],
    ));
  }
}

// TODO: Implement the helper method _depositDialog(). (100 pts)
// Take the BuildContext as a parameter named context
// Return a Future<void>
// Create a final local var called _keyForm which is set to a GlobalKey<FormState>() instance
// Call the showDialog() function with the following param values:
//   The builder parameter should be set to an anonymous function that implements the following structure:
//     return an AlertDialog with the following params:
//       title set to a Form widget with the following params:
//          key set to _keyForm
//          child set to a TextFormField that is setup to accept a decimal input and has the following params:
//              onSaved set to a function that gets the instance of the Bank and calls Bank.deposit() with the value from the form (if non-null)
//              validator set to a function that returns an error string if the amount is empty or cannot be parsed as a double, otherwise returns null
//              Note: for onSaved and validator functions consider double.tryParse() which doesn't throw an exception if parsing fails (instead returns null)
//       actions set to a list with two buttons:
//           a save button that when pressed calls _keyForm.currentState.validate() (if _keyForm.currentState is not null)
//               and if validate() returns true
//                   calls _keyForm.currentState.save() (if _keyForm.currentState is not null)
//                   calls Navigator.pop(context)
//           a cancel button that when pressed calls Navigator.pop(context)
//

// Total points: 130
