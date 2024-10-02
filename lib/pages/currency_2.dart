//****************************************************************************
// currency_1.dart - Implements a fictional currency page
//
// Boise State University CS 402
// Dr. Henderson
// Homework 4
//
// This implements the fictional currency UI as described in the README.md.
// You will need to copy this module three times and implement three different
// fictional currencies
//----------------------------------------------------------------------------
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../widgets/bank.dart';

// TODO: Create a page to implement the fictional currency UI. (50 pts)
// Override the build method to display the UI as specified in the README.md
// You will need to get an instance of the bank using Bank.of(context)
// Once you have the bank instance you can call Bank.buy() with your fictional items and you can get the current balance through the Bank.vault.balance getter
// You will need to convert the balance based on the exchange rate (you make up)

class Currency2 extends StatelessWidget {
  const Currency2({super.key});

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
              Text("Currency 2 Page", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ],
    ));
  }
}

// Total points: 50
