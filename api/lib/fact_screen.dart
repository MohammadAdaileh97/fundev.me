import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FactScreen extends StatefulWidget {
  const FactScreen({super.key});

  @override
  State<FactScreen> createState() => _FactScreenState();
}

class _FactScreenState extends State<FactScreen> {
  String fact = "";
  int length = 0;

  @override
  void initState() {
    super.initState();
    getFact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(fact), Text(length.toString())],
        ),
      ),
    );
  }

  getFact() async {
    final response = await http.get(Uri.parse("https://catfact.ninja/fact"));

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      fact = jsonBody["fact"];
      length = jsonBody["length"];
      setState(() {});
    }
  }
}
