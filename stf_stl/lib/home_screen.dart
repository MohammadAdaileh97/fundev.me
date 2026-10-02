import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: Center(child: Text(i.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          i++;
          print(i);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
