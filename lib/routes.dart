import 'package:flutter/material.dart';
import 'main.dart';
import 'pages/home.dart';
import 'pages/currency_1.dart';

// TODO: Each route should be a MainScaffold
// TODO: Each route has a page widget; i.e. Home()
final Map<String, Widget Function(BuildContext)> routes = {
  paths[0]: (BuildContext context) => dashboard,
  paths[1]: (BuildContext context) => currency1,
};

final List<String> paths = ['/', '/currency1'];

void home(BuildContext context) {
  Navigator.pushReplacementNamed(context, paths[0]);
}

// Page fields
const MainScaffold dashboard =
    MainScaffold(title: 'Currency Quest', child: Home());
const MainScaffold currency1 =
    MainScaffold(title: 'Currency 1', child: Currency1());
