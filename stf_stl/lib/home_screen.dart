import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: Center(child: Text(i.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            i++;
          });
          debugPrint(i.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
