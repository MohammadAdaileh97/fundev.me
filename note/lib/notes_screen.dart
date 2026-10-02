import 'package:flutter/material.dart';
import 'package:note/add_note_screen.dart';
import 'package:note/db_helper.dart';
import 'package:note/update_note.dart';

import 'note.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Note> notes = [];
  DbHelper dbHelper = DbHelper();

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  getNotes() async {
    notes = await dbHelper.getNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(notes[index].msg),
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateNote(note: notes[index]),
                        ),
                      );

                      getNotes();
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () async {
                      await dbHelper.deleteNote(id: notes[index].id);
                      getNotes();
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ],
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
          getNotes();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
