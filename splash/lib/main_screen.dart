import 'package:flutter/material.dart';
import 'package:splash/cart_screen.dart';
import 'package:splash/home_screen.dart';
import 'package:splash/more_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  Widget selectedWidget = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: selectedWidget,
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Colors.red,
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          if (selectedIndex == 0) {
            selectedWidget = HomeScreen();
          } else if (selectedIndex == 1) {
            selectedWidget = CartScreen();
          } else {
            selectedWidget = MoreScreen();
          }
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: "MORE"),
        ],
      ),
    );
  }
}
