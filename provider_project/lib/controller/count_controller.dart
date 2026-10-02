import 'package:flutter/cupertino.dart';

class CountController extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
