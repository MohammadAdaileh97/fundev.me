import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/note_controller.dart';
import '../../model/note_model.dart';
import '../screens/update_note_screen.dart';

class ListNoteItem extends StatelessWidget {
  final NoteModel note;

  const ListNoteItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: ListTile(
        title: Text(note.msg),
        trailing: Column(
          children: [
            InkWell(
              child: Icon(Icons.edit),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateNoteScreen(noteModel: note),
                  ),
                );
              },
            ),
            InkWell(
              child: Icon(Icons.delete),
              onTap: () {
                Provider.of<NoteController>(
                  context,
                  listen: false,
                ).deleteNote(id: note.id, userId: note.userId);
              },
            ),
          ],
        ),
      ),
    );
  }
}
