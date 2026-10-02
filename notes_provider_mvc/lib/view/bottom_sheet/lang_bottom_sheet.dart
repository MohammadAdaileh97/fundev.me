import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_lang/l10n/app_localizations.dart';
import 'package:theme_lang/view/widget/custom_button.dart';

import '../../controller/lang_controller.dart';

class LangBottomSheet extends StatelessWidget {
  const LangBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),

      child: Consumer<LangController>(
        builder: (context, langController, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.selectLanguage,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border:
                      !langController.arabic
                          ? Border.all(color: Colors.grey.shade300, width: 1)
                          : null,
                ),
                child: ListTile(
                  onTap: () {
                    langController.changeArabic(arabic: false);
                  },
                  title: Text(AppLocalizations.of(context)!.english),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border:
                      langController.arabic
                          ? Border.all(color: Colors.grey.shade300, width: 1)
                          : null,
                ),
                child: ListTile(
                  onTap: () {
                    langController.changeArabic(arabic: true);
                  },
                  title: Text(AppLocalizations.of(context)!.arabic),
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: AppLocalizations.of(context)!.save,
                onTap: () {
                  langController.changeLang(
                    lang: langController.arabic ? "ar" : "en",
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
