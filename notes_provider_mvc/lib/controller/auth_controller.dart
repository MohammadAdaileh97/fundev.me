import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:theme_lang/utl/const_value.dart';

class AuthController extends ChangeNotifier {
  late Database database;
  bool showErrorEmail = false;
  bool showErrorPassword = false;
  bool showErrorConfPassword = false;
  bool showErrorName = false;
  bool showPassword = false;
  bool showConfPassword = false;

  checkEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    showErrorEmail = !regExp.hasMatch(email);
    notifyListeners();
  }

  checkPassword(String password) {
    showErrorPassword = password.isEmpty;
    notifyListeners();
  }

  checkName(String name) {
    showErrorName = name.isEmpty;
    notifyListeners();
  }

  checkConfPassword(String password, String confPassword) {
    showErrorConfPassword = password != confPassword;
    notifyListeners();
  }

  changeShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  changeShowConfPassword() {
    showConfPassword = !showConfPassword;
    notifyListeners();
  }

  openDataBaseFile() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'note.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Note (id INTEGER PRIMARY KEY, msg TEXT, userId INTEGER)',
        );

        await db.execute(
          'CREATE TABLE User (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT)',
        );
      },
    );
  }

  Future<bool> login({required String email, required String password}) async {
    await openDataBaseFile();
    List<Map<String, dynamic>> userMaps = await database.rawQuery(
      "SELECT * FROM User WHERE email = '$email' AND password = '$password'",
    );
    await database.close();
    if (userMaps.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt(ConstValue.userId, userMaps[0]['id']);

      return true;
    } else {
      return false;
    }
  }

  signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    await openDataBaseFile();
    await database.rawInsert(
      "INSERT INTO User (name, email, password) VALUES ('$name', '$email', '$password')",
    );
    await database.close();
  }
}
