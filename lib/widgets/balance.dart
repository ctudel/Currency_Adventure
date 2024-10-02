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
  @override
  Widget build(BuildContext context) {
    final Bank bank = Bank.of(context);

    return Flexible(
      child: Card(
        child: Container(
          // Main Container
          alignment: Alignment.topLeft,
          padding:
              const EdgeInsets.only(top: 10, right: 25, bottom: 10, left: 25),
          margin: const EdgeInsets.all(10),
          decoration: border,
          height: 150,
          // Balance elements
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Balance Label and Deposit Button
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Balance:",
                      style: TextStyle(color: Colors.black, fontSize: 32)),
                  // Deposit Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      elevation: 4,
                    ),
                    onPressed: () {
                      // FIXME: deposit with user input on dialogue
                      bank.deposit(5);
                      // Calling setState() will force Flutter to update dependent child widgets
                      setState(() {});
                    },
                    child: const Text("Deposit",
                        style: TextStyle(color: Colors.black, fontSize: 26)),
                  ),
                ],
              ),
              // Balance Value
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text('${bank.vault.balance}',
                    style: const TextStyle(color: Colors.black, fontSize: 32)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
