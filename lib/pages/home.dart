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
import '../widgets/balance.dart';
import '../widgets/purchased_items.dart';
import '../widgets/bank.dart';

// TODO: Create a stateless widget to display the home page. (30 pts)
// In your build method, you will need to get the Bank instance by calling Bank.of(context). Once you have it
// Your widget should implement the UI as described in the README.md
// When the user presses the [deposit] button your app should call the helper method _depositDialog()

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            // Balance
            Balance(),
            SizedBox(height: 10),
            // Purchased Items
            const PurchasedItems(),
          ],
        ));
  }
}

// Container Border
final BoxDecoration border = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.yellow, width: 2),
    borderRadius: BorderRadius.circular(20));


// Total points: 130
