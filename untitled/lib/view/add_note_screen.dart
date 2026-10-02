import 'package:flutter/material.dart';
import 'package:untitled/controller/db_controller.dart';

class AddNoteScreen extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: textEditingController,
            decoration: InputDecoration(
              label: Text("Note"),
              hintText: "Type Something...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: TextButton(
        onPressed: () async {
          await DbController().insertNote(msg: textEditingController.text);
          Navigator.pop(context);
        },
        child: Text("Save"),
      ),
    );
  }
}
