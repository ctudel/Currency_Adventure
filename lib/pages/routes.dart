import 'package:flutter/material.dart';
import '../main.dart';
import '../pages/home.dart';
import '../widgets/currency.dart';

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

const MainScaffold currency1 = MainScaffold(
    title: 'Pokemon',
    child: Currency(
        currencyImage: 'pokeball.png',
        backgroundImage: 'pokemon.png',
        conversionRate: 100,
        itemNames: ['squirtle', 'charmander', 'bulbasaur'],
        itemFantasyPrices: [100, 100, 100]));

const MainScaffold currency2 = MainScaffold(
    title: 'Animal Crossing',
    child: Currency(
        currencyImage: 'bell.png',
        backgroundImage: 'animal_crossing.jpg',
        conversionRate: 135,
        itemNames: ['billy', 'jay', 'anchovy'],
        itemFantasyPrices: [100, 400, 300]));

const MainScaffold currency3 = MainScaffold(
    title: 'Zelda',
    child: Currency(
        currencyImage: 'rupee.png',
        backgroundImage: 'zelda.jpg',
        conversionRate: 100,
        itemNames: ['ocarina', 'heart', 'link'],
        itemFantasyPrices: [200, 500, 800]));
