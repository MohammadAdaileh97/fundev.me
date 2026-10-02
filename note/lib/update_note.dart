import 'package:flutter/material.dart';

import 'db_helper.dart';
import 'note.dart';

class UpdateNote extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  DbHelper dbHelper = DbHelper();
  Note note;

  UpdateNote({required this.note}) {
    textEditingController.text = note.msg;
  }

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
          await dbHelper.updateNote(
            id: note.id,
            msg: textEditingController.text,
          );
          Navigator.pop(context);
        },
        child: Text("Save"),
      ),
    );
  }
}
