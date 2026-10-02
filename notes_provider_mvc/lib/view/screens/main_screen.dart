import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_lang/controller/note_controller.dart';
import 'package:theme_lang/view/screens/add_note_screen.dart';
import 'package:theme_lang/view/screens/setting_screen.dart';
import 'package:theme_lang/view/widget/list_note_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.notes),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Consumer<NoteController>(
        builder: (context, noteController, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListNoteItem(note: noteController.notes[index]);
            },
            itemCount: noteController.notes.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
