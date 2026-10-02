import 'package:flutter/material.dart';
import 'package:splash/cart_screen.dart';
import 'package:splash/home_screen.dart';
import 'package:splash/more_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
       
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "HOME"),
              Tab(icon: Icon(Icons.shopping_cart), text: "Cart"),
              Tab(icon: Icon(Icons.more), text: "More"),
            ],
          ),
        ),
        body: TabBarView(children: [HomeScreen(), CartScreen(), MoreScreen()]),
      ),
    );
  }
}
