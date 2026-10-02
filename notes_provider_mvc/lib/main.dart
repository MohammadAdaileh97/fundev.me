import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:theme_lang/controller/note_controller.dart';
import 'package:theme_lang/controller/auth_controller.dart';
import 'package:theme_lang/l10n/app_localizations.dart';
import 'package:theme_lang/controller/theme_controller.dart';
import 'package:theme_lang/view/screens/splash_screen.dart';

import 'controller/lang_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LangController()..getLang()),
        ChangeNotifierProvider(create: (_) => ThemeController()..getTheme()),
        ChangeNotifierProvider(create: (_) => NoteController()),
        ChangeNotifierProvider(create: (_) => AuthController()),
      ],
      child: Consumer2<LangController, ThemeController>(
        builder: (context, langProvider, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: themeProvider.isDark ? ThemeData.dark() : ThemeData.light(),
            localizationsDelegates: [
              AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: langProvider.selectedLang,
            supportedLocales: [Locale('en'), Locale('ar')],
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
