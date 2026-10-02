import 'package:flutter/material.dart';

class ColScreen extends StatelessWidget {
  const ColScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: Container(
        color: Colors.green,
        width: 1000,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("dataasdasdasdasdasdasasd"),
            Icon(Icons.add),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
