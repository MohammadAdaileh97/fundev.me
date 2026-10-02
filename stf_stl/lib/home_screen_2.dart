import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => HomeScreen2State();
}

class HomeScreen2State extends State<HomeScreen2> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
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
