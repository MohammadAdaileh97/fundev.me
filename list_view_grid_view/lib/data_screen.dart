import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  String data = '';
  bool checkBoxValue = false;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(data),
          TextField(controller: textEditingController),
          Row(
            children: [
              Checkbox(
                value: checkBoxValue,
                onChanged: (value) {
                  checkBoxValue = value!;
                  setState(() {});
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("DataKey", textEditingController.text);
                },
                child: Text("Save"),
              ),
              ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  data = prefs.getString("DataKey") ?? "";
                  setState(() {});
                },
                child: Text("Read"),
              ),
              ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove("DataKey");
                },
                child: Text("Remove"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
