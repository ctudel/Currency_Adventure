//****************************************************************************
// currency_1.dart - Implements a fictional currency page
//
// Boise State University
// Dr. Henderson
// Homework 4
//
// This implements the fictional currency UI as described in the README.md.
// You will need to copy this module three times and implement three different
// fictional currencies
//----------------------------------------------------------------------------
import 'package:flutter/material.dart';

import '../widgets/bank.dart';

// TODO: Create a page to implement the fictional currency UI. (50 pts)
// Override the build method to display the UI as specified in the README.md
// You will need to get an instance of the bank using Bank.of(context)
// Once you have the bank instance you can call Bank.buy() with your fictional items and you can get the current balance through the Bank.vault.balance getter
// You will need to convert the balance based on the exchange rate (you make up)

class Currency extends StatefulWidget {
  final String currencyImage;
  final String backgroundImage;
  final double conversionRate;
  final List<String> itemNames;
  final List<double> itemFantasyPrices;

  const Currency({
    super.key,
    required this.currencyImage,
    required this.backgroundImage,
    required this.conversionRate,
    required this.itemNames,
    required this.itemFantasyPrices,
  });

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  @override
  Widget build(BuildContext context) {
    final Bank bank = Bank.of(context);
    final double balance = bank.vault.balance * widget.conversionRate;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/${widget.backgroundImage}'),
              fit: BoxFit.cover,
              alignment: const Alignment(-0.6, 0))),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Image.asset('assets/${widget.currencyImage}',
                  width: 60, height: 60),
              Text('${balance.toStringAsFixed(2)}',
                  style: const TextStyle(
                      backgroundColor: Colors.white,
                      color: Colors.blue,
                      fontSize: 30)),
            ]),
          ),
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              itemButton(widget.itemNames[0], widget.conversionRate,
                  widget.itemFantasyPrices[0]),
              const SizedBox(width: 20),
              itemButton(widget.itemNames[1], widget.conversionRate,
                  widget.itemFantasyPrices[1]),
              const SizedBox(width: 20),
              itemButton(widget.itemNames[2], widget.conversionRate,
                  widget.itemFantasyPrices[2]),
            ],
          ),
        ],
      ),
    );
  }

  Widget itemButton(String name, double conversionRate, double fantasyPrice) {
    final Bank bank = Bank.of(context);
    final double price = fantasyPrice / conversionRate;

    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              bank.buy(name, price);
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 5,
                fixedSize: const Size(100, 100)),
            child: Image.asset('assets/$name.png', width: 80, height: 80)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/${widget.currencyImage}',
                width: 40, height: 40),
            Text('$fantasyPrice',
                style: const TextStyle(
                    backgroundColor: Colors.white,
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }
}

// Total points: 50
