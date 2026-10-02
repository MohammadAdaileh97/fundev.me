import 'package:flutter/material.dart';
import 'package:untitled/controller/db_controller.dart';
import 'package:untitled/model/note_model.dart';

class UpdateNoteScreen extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  NoteModel noteModel;

  UpdateNoteScreen({super.key, required this.noteModel}) {
    textEditingController.text = noteModel.msg;
  }

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
          await DbController().updateNote(
            msg: textEditingController.text,
            id: noteModel.id,
          );
          Navigator.pop(context);
        },
        child: Text("Save"),
      ),
    );
  }
}
