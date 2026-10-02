import 'dart:convert';

import 'package:api/data_model.dart';
import 'package:api/source_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  List<DataModel> dataList = [];
  List<SourceModel> sourceList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(dataList[index].nation ?? "-"),
              Text(dataList[index].slugNation ?? "-"),
            ],
          );
        },
        itemCount: dataList.length,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final response = await http.get(
      Uri.parse(
        "https://datausa.io/api/data?drilldowns=Nation&measures=Population",
      ),
    );
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var data = jsonBody["data"];
      var source = jsonBody["source"];

      for (Map<String, dynamic> i in data) {
        dataList.add(DataModel.fromJson(json: i));
      }

      for (Map<String, dynamic> i in source) {
        sourceList.add(SourceModel.fromJson(json: i));
      }
      setState(() {});
    }
  }
}
