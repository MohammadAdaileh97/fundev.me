import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utl/const_value.dart';

class ThemeController extends ChangeNotifier {
  bool isDark = false;

  Future<void> changeTheme({required bool isDark}) async {
    this.isDark = isDark;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(ConstValue.isDark, isDark);
  }

  getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool(ConstValue.isDark) ?? false;
    notifyListeners();
  }
}
