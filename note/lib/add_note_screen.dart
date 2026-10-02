import 'package:flutter/material.dart';
import 'package:note/db_helper.dart';

class AddNoteScreen extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  DbHelper dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextField(
        controller: textEditingController,
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
      bottomNavigationBar: TextButton(
        onPressed: () async {
          await dbHelper.insertNote(msg: textEditingController.text);
          Navigator.pop(context);
        },
        child: Text("Save"),
      ),
    );
  }
}
