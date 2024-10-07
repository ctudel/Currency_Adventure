import 'package:flutter/material.dart';
import '../pages/home.dart';

class PurchasedItems extends StatelessWidget {
  const PurchasedItems({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        elevation: 20,
        color: cardColor,
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 10),
          margin: const EdgeInsets.all(10),
          child: const Column(
            children: [
              Text("Purchased Items:", style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}
