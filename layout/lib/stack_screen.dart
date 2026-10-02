import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 500,
            height: 500,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.amber, width: 5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "dataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaa",
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 300,
                height: 300,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  border: Border.all(color: Colors.cyan, width: 5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "dataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaa",
                ),
              ),
              Container(
                width: 200,
                height: 200,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  border: Border.all(color: Colors.cyan, width: 5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "dataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaadataaaaaaaaaa",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
