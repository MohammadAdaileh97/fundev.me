import 'package:flutter/material.dart';
import 'package:untitled/controller/db_controller.dart';
import 'package:untitled/model/note_model.dart';
import 'package:untitled/view/note_item.dart';
import 'package:untitled/view/update_note_screen.dart';

import 'add_note_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<NoteModel> notes = [];
  DbController dbController = DbController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    notes = await dbController.getNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return NoteItem(
            noteModel: notes[index],
            onPressedEdit: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => UpdateNoteScreen(noteModel: notes[index]),
                ),
              );
              getData();
            },
            onPressedDelete: () async {
              await dbController.deleteNote(id: notes[index].id);
              getData();
            },
          );
        },
        itemCount: notes.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
          getData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
