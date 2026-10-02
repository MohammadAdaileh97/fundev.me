import 'package:flutter/material.dart';
import 'package:splash/cart_screen.dart';
import 'package:splash/home_screen.dart';
import 'package:splash/more_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  Widget selectedWidget = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedWidget,
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Container(color: Colors.purple)),
            ListTile(
              onTap: () {
                selectedWidget = HomeScreen();

                setState(() {});
                Navigator.pop(context);
              },
              title: Text("Home"),
              subtitle: Text("Home Sub Title"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: () {
                selectedWidget = CartScreen();
                setState(() {});
                Navigator.pop(context);
              },
              title: Text("Cart"),
              subtitle: Text("Cart Sub Title"),
              leading: Icon(Icons.shopping_cart),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: () {
                selectedWidget = MoreScreen();
                setState(() {});
                Navigator.pop(context);
              },
              title: Text("More"),
              subtitle: Text("More Sub Title"),
              leading: Icon(Icons.more),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
