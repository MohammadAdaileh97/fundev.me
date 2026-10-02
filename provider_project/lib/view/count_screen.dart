import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/controller/count_controller.dart';

class CountScreen extends StatelessWidget {
  const CountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CountController>(
        builder: (context, value, child) {
          print("Consumer");
          return Center(child: Text(value.count.toString()));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CountController>(context, listen: false).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
