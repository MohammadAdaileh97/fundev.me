import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_lang/utl/const_value.dart';

class LangController extends ChangeNotifier {
  Locale selectedLang = Locale('en');
  bool arabic = false;

  changeLang({required String lang}) async {
    selectedLang = Locale(lang);
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ConstValue.lang, lang);
  }

  getLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedLang = Locale(prefs.getString(ConstValue.lang) ?? "en");
    arabic = (prefs.getString(ConstValue.lang) ?? "en") == "ar";
    notifyListeners();
  }

  changeArabic({required bool arabic}) async {
    this.arabic = arabic;
    notifyListeners();
  }
}
