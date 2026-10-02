import 'package:flutter/material.dart';
import 'package:untitled/model/note_model.dart';

class NoteItem extends StatelessWidget {
  final NoteModel noteModel;
  final VoidCallback? onPressedEdit;
  final VoidCallback? onPressedDelete;

  const NoteItem({
    super.key,
    required this.noteModel,
    required this.onPressedEdit,
    required this.onPressedDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(noteModel.msg),
        Row(
          children: [
            IconButton(onPressed: onPressedDelete, icon: Icon(Icons.delete)),
            IconButton(onPressed: onPressedEdit, icon: Icon(Icons.edit)),
          ],
        ),
      ],
    );
  }
}
