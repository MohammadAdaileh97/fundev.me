import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_lang/model/note_model.dart';
import 'package:theme_lang/view/widget/custom_button.dart';

import '../../controller/note_controller.dart';
import '../widget/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              text: AppLocalizations.of(context)!.editNote,
              onTap: () async {
                noteController.checkErrorMsg(msg: textEditingController.text);
                if (noteController.showErrorMessage) {
                  return;
                }

                await noteController.updateNote(
                  userId: noteModel.userId,
                  msg: textEditingController.text,
                  id: noteModel.id,
                );
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }
}
