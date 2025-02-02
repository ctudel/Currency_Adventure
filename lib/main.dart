//****************************************************************************
// main.dart - Main app file
//
// Dr. Henderson
// Homework 4
//----------------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:hw4/widgets/bank.dart';
import 'models/vault.dart';
import 'currency_icons.dart';
import 'pages/routes.dart';

void main() {
  // Create a GlobalKey that we can pass to child nodes so they can find the instance of the state
  runApp(MyApp(key: GlobalKey<_MyAppState>()));
}

//**************************************************************************************************
// Create a stateful widget so that we can create an instance of Vault to keep user's balance, etc.
//--------------------------------------------------------------------------------------------------
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState(key as GlobalKey<_MyAppState>);
}

class _MyAppState extends State<MyApp> {
  // Create a persistent Vault so changes to the user's balance, etc. do not disappear
  final Vault vault = Vault();

  // Keep a copy of the wrapper widget's key so children kind find this state instance
  final GlobalKey<_MyAppState> appKey;

  _MyAppState(this.appKey);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: Wrap a MaterialApp widget in the Bank inherited widget. (20 pts)
    // You will need to pass the appKey and vault to the Bank widget
    // Pass in the title, theme, and routes to the MaterialApp
    // Your routes should be a map of navigation routes from the route name (String) to a widget
    // We will wrap all routes in the MainScaffold widget to get a consistent look and feel so your
    // first route (the home route) should be: '/' => MainScaffold(title: 'Currency Quest', child: HomePage() ),
    // You will need to add your three pages as similar routes (with different names

    return Bank(
      appKey: appKey,
      vault: vault,
      child: MaterialApp(
        title: "testing",
        theme: ThemeData(
            colorScheme: const ColorScheme(
                brightness: Brightness.light,
                primary: Colors.black,
                onPrimary: Color.fromRGBO(255, 255, 255, 0.9),
                secondary: Colors.white,
                onSecondary: Colors.white,
                error: Colors.red,
                onError: Colors.black,
                surface: Colors.blue,
                onSurface: Colors.white)),
        routes: routes,
      ),
    );
  }
}

//**************************************************************************************************
// MainScaffold is a custom widget to enforce the same scaffold settings for all routes
//--------------------------------------------------------------------------------------------------
class MainScaffold extends StatelessWidget {
  // TODO: Create two final fields: a Widget named child, and a String named title. (5 pts)
  final Widget child;
  final String title;

  // TODO: Create the constructor that takes required named parameters for the child and title fields. (5 pts)
  const MainScaffold({super.key, required this.child, required this.title});

  // TODO: Override the build() method to return a Scaffold widget with the following properties: (30 pts)
  // An AppBar that sets your app's title and backgroundColor (usually Theme.oF(context).colorScheme.inversePrimary)
  //   Set the AppBar actions param to a list with a single IconButton that when pressed goes to the home screen
  //   using Navigator.of(context).pushReplacementNamed('/')
  // The body parameter set to this class' child field
  // A bottomNavigationBar with at least three items representing each of your fictional currency pages
  // An onTap function that uses the index to pass the correct named route to Navigator.of(context).pushReplacementNamed()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        title: Text(title),
        actions: [
          // Back to Home button
          IconButton(
              padding: const EdgeInsets.only(right: 25),
              onPressed: () => home(context),
              icon: const Icon(Icons.home))
        ],
      ),
      // Current Page to Display
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        indicatorColor: Colors.transparent,
        destinations: const [
          // Currency 1 Button
          NavigationDestination(icon: Icon(CurrencyIcons.pokeball), label: ""),
          // Currency 2 Button
          NavigationDestination(
              icon: Icon(CurrencyIcons.animalCrossing), label: ""),
          // Currency 3 Button
          NavigationDestination(icon: Icon(CurrencyIcons.zelda), label: ""),
        ],
        onDestinationSelected: (index) =>
            Navigator.pushReplacementNamed(context, paths[index + 1]),
      ),
    );
  }
}


// Total points: 60
