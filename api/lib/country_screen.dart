import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'country_model.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  List<CountryModel> countries = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(countries[index].countryId),
              Text(countries[index].probability.toString()),
            ],
          );
        },
        itemCount: countries.length,
      ),
    );
  }

  getData() async {
    final response = await http.get(
      Uri.parse("https://api.nationalize.io/?name=nathaniel"),
    );
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var country = jsonBody["country"];
      for (Map i in country) {
        countries.add(
          CountryModel(
            countryId: i["country_id"],
            probability: i["probability"],
          ),
        );
      }
      setState(() {});
    }
  }
}
