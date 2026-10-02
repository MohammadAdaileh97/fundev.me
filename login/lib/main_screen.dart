import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  String email;
  String password;

  MainScreen({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [Text(email), Text(password)]),
    );
  }
}
