import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_lang/controller/lang_controller.dart';
import 'package:theme_lang/controller/theme_controller.dart';
import 'package:theme_lang/l10n/app_localizations.dart';
import 'package:theme_lang/utl/const_value.dart';
import 'package:theme_lang/view/screens/login_screen.dart';

import '../bottom_sheet/lang_bottom_sheet.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<ThemeController>(
              builder: (context, themeController, child) {
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                  ),
                  child: ListTile(
                    leading: Switch(
                      value: themeController.isDark,
                      onChanged: (value) {
                        themeController.changeTheme(isDark: value);
                      },
                    ),
                    title: Text(AppLocalizations.of(context)!.darkMode),
                  ),
                );
              },
            ),

            Consumer<LangController>(
              builder: (context, langController, child) {
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                  ),
                  child: ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return LangBottomSheet();
                        },
                      ).then((value) {
                        langController.getLang();
                      });
                    },
                    leading: Icon(Icons.language),
                    title: Text(AppLocalizations.of(context)!.lang),
                  ),
                );
              },
            ),

            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: ListTile(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove(ConstValue.userId);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
                  );
                },
                leading: Icon(Icons.logout),
                title: Text(AppLocalizations.of(context)!.logout),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
