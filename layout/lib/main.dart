import 'package:flutter/material.dart';
import 'package:layout/col_screen.dart';
import 'package:layout/conte_screen.dart';
import 'package:layout/row_screen.dart';
import 'package:layout/stack_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: StackScreen(),
    );
  }
}
