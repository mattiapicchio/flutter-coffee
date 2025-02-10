import 'package:flutter/material.dart';
import 'package:flutter_coffee/datamanager.dart';
import 'package:flutter_coffee/pages/menupage.dart';
import 'package:flutter_coffee/pages/offerspage.dart';
import 'package:flutter_coffee/pages/orderspage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
        // primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dataManager = DataManager();
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = MenuPage(
      dataManager: dataManager,
    );

    switch (selectedIndex) {
      case 0:
        currentWidgetPage = MenuPage(
          dataManager: dataManager,
        );
        break;
      case 1:
        currentWidgetPage = const OffersPage();
        break;
      case 2:
        currentWidgetPage = OrderPage(
          dataManager: dataManager,
        );
        break;
      default:
    }

    return Scaffold(
        appBar: AppBar(
          title: Image.asset('images/logo.png'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (newIndex) => setState(() => selectedIndex = newIndex),
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Colors.orangeAccent[200],
            unselectedItemColor: Colors.blueGrey[200],
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.coffee,
                ),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_offer),
                label: 'Offers',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Orders',
              ),
            ]),
        body: currentWidgetPage);
  }
}
