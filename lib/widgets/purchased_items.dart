import 'package:flutter/material.dart';
import '../styles/style.dart';
import '../widgets/bank.dart';

class PurchasedItems extends StatelessWidget {
  const PurchasedItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bank = Bank.of(context);

    return Flexible(
      child: Card(
        elevation: 10,
        color: cardColor,
        child: Column(
          children: [
            Text('Purchased Items', style: textStyle),
            const SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                itemCount: bank.vault.items.length,
                itemBuilder: (context, index) {
                  final item = bank.vault.items.entries.elementAt(index);
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 8),
                        Image.asset('assets/${item.key}.png',
                            width: 40, height: 40)
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Quantity: ${item.value}',
                            style: TextStyle(
                                color: index.isEven
                                    ? Colors.white
                                    : Colors.black)),
                      ],
                    ),
                    tileColor: index.isEven ? Colors.blue : Colors.white,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
