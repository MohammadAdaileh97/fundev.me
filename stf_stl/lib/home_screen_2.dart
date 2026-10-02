import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreen2State();
  }
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
          i++;
          setState(() {});
          print(i);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
