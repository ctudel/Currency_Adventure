import 'package:flutter/material.dart';
import '../widgets/bank.dart';

class Balance extends StatelessWidget {
  const Balance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Bank bank = Bank.of(context);

    return Flexible(
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
                  onPressed: () {
                    print(bank);
                    bank.deposit(5);
                    print(bank.vault.balance.toString());
                  },
                  child: const Text("Deposit",
                      style: TextStyle(color: Colors.black, fontSize: 26)),
                ),
              ],
            ),
            // Balance Value
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Text(bank.vault.balance.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 32)),
            ),
          ],
        ),
      ),
    );
  }
}

// Container Border
final BoxDecoration border = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.blue, width: 2),
    borderRadius: BorderRadius.circular(20));
