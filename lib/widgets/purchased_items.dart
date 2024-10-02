import 'package:flutter/material.dart';

class PurchasedItems extends StatelessWidget {
  const PurchasedItems({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 10),
        margin: const EdgeInsets.all(10),
        decoration: border,
        child: const Column(
          children: [
            Text("Purchased Items:",
                style: TextStyle(color: Colors.black, fontSize: 26)),
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
