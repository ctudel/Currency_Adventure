//****************************************************************************
// vault.dart - Data abstraction for the user's balance and list of purchased items
//
// Boise State University CS 402
// Dr. Henderson
// Homework 4
//
// The vault class abstracts and manages the currency balance (in US dollars)
// and the list of purchased items.
//----------------------------------------------------------------------------

// TODO: Create a class called Vault with the following properties: (30 pts)
class Vault {
// Fields:
// _balance - A double which keeps track of the user's balance in the base currency (US Dollars)
// items - A map of strings -> int, which keeps track of the count of each item purchased
  double _balance;
  final Map<String, int> items = {};

// Getters:
// balance - returns the current balance
  double get balance => _balance;

// Constructor:
// The constructor should take an optional *positional* parameter that sets the _balance field and defaults to 0
  Vault([this._balance = 0]);

//
// Methods:
// buy(String item, double amount)
//   checks if the current balance is greater than [amount] and if so debits the current balance and adds the item to
//   the purchased items. Returns a boolean reflecting whether the purchase succeeded
  bool buy(String item, double amount) {
    if (_balance > amount) {
      _balance -= amount;
      items[item] = items.containsKey(item) // increments item quantity
          ? items[item]! + 1
          : 1;
      return true;
    }

    return false;
  }

//
// deposit(double amount) - Add amount to the current balance
  void deposit(double amount) {
    _balance += amount;
  }
}

// Total points: 30
