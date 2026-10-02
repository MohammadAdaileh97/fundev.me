import 'package:flutter/material.dart';

class ConteScreen extends StatelessWidget {
  const ConteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),
      body: Container(
        width: 500,
        height: 500,
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(color: Colors.amber, width: 5),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(
          "dataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaa",
        ),
      ),
    );
  }
}
