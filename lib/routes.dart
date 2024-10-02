import 'package:flutter/material.dart';
import 'main.dart';
import 'pages/home.dart';
import 'pages/currency_1.dart';
import 'pages/currency_2.dart';
import 'pages/currency_3.dart';

// TODO: Each route should be a MainScaffold
// TODO: Each route has a page widget; i.e. Home()
final Map<String, Widget Function(BuildContext)> routes = {
  paths[0]: (BuildContext context) => dashboard,
  paths[1]: (BuildContext context) => currency1,
  paths[2]: (BuildContext context) => currency2,
  paths[3]: (BuildContext context) => currency3,
};

final List<String> paths = ['/', '/currency1', '/currency2', '/currency3'];

void home(BuildContext context) {
  Navigator.pushReplacementNamed(context, paths[0]);
}

// Page fields
const MainScaffold dashboard =
    MainScaffold(title: 'Currency Quest', child: Home());
const MainScaffold currency1 =
    MainScaffold(title: 'Currency 1', child: Currency1());
const MainScaffold currency2 =
    MainScaffold(title: 'Currency 2', child: Currency2());
const MainScaffold currency3 =
    MainScaffold(title: 'Currency 3', child: Currency3());
