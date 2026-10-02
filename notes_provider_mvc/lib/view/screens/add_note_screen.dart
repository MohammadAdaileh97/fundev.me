import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_lang/l10n/app_localizations.dart';
import 'package:theme_lang/view/widget/custom_button.dart';

import '../../controller/note_controller.dart';
import '../../utl/const_value.dart';
import '../widget/custom_text_field.dart';

class AddNoteScreen extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Consumer<NoteController>(
                builder: (context, noteController, child) {
                  return CustomTextField(
                    label: AppLocalizations.of(context)!.note,
                    textEditingController: textEditingController,
                    hintText: AppLocalizations.of(context)!.pleaseEnterYourNote,
                    obscureText: false,
                    textInputType: TextInputType.multiline,
                    prefixIcon: Icon(Icons.note),
                    suffixIcon: null,
                    errorText:
                        noteController.showErrorMessage
                            ? AppLocalizations.of(context)!.required
                            : null,
                    maxLines: null,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer<NoteController>(
        builder: (context, noteController, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              text: AppLocalizations.of(context)!.addNote,
              onTap: () async {
                noteController.checkErrorMsg(msg: textEditingController.text);
                if (noteController.showErrorMessage) {
                  return;
                }
                SharedPreferences prefs = await SharedPreferences.getInstance();
                int userId = prefs.getInt(ConstValue.userId) ?? 0;

                await noteController.insertNote(
                  msg: textEditingController.text,
                  userId: userId,
                );
                if (!context.mounted) return;
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }
}
