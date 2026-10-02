import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_lang/controller/note_controller.dart';
import 'package:theme_lang/view/screens/login_screen.dart';
import 'package:theme_lang/view/screens/main_screen.dart';

import '../../utl/const_value.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      int userID = prefs.getInt(ConstValue.userId) ?? -1;

      Provider.of<NoteController>(
        context,
        listen: false,
      ).getAllNotes(userId: userID);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => userID != -1 ? MainScreen() : LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/images/notes.png")),
    );
  }
}
