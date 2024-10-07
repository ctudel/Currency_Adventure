import 'package:flutter/material.dart';
import '../widgets/bank.dart';
import '../pages/home.dart';

class Balance extends StatefulWidget {
  const Balance({
    super.key,
  });

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  double? _amount = 0;

  @override
  Widget build(BuildContext context) {
    final Bank bank = Bank.of(context);

    return Flexible(
      child: Card(
        color: cardColor,
        child: Container(
          // Main Container
          alignment: Alignment.topLeft,
          padding:
              const EdgeInsets.only(top: 10, right: 25, bottom: 10, left: 25),
          margin: const EdgeInsets.all(10),
          height: 150,
          // Balance elements
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Balance Label and Deposit Button
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Balance:", style: textStyle),
                  // Deposit Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      elevation: 4,
                    ),
                    onPressed: () {
                      _depositDialog(context);
                    },
                    child: const Text("Deposit",
                        style: TextStyle(color: Colors.white, fontSize: 26)),
                  ),
                ],
              ),
              // Balance Value
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text('\$ ${bank.vault.balance}', style: textStyle),
              ),
            ],
          ),
        ),
      ),
    );
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
  Future<void> _depositDialog(BuildContext context) {
    final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // Form for user input
            title: Column(
              children: [
                // Text('Amount:'),
                Form(
                    key: keyForm,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Enter amount to deposit in USD'),
                      validator: (String? value) {
                        double? userIn = double.tryParse(value.toString());
                        if (value.toString().isEmpty ||
                            userIn == null ||
                            userIn < 0) {
                          return 'Please enter a valid amount';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        double? amount = double.tryParse(value.toString());
                        _amount =
                            amount ?? 0; // if invalid input, deposit 0 onSaved
                      },
                    )),
              ],
            ),
            // Action buttons
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                  FilledButton(
                      onPressed: () {
                        if (keyForm.currentState != null &&
                            keyForm.currentState!.validate()) {
                          keyForm.currentState!.save();
                          Bank.of(context).deposit(_amount ?? 0);
                          setState(() {});
                        }
                        if (keyForm.currentState != null)
                          Navigator.pop(context);
                      },
                      child: const Text('Submit')),
                ],
              ),
            ],
          );
        });
  }
}
