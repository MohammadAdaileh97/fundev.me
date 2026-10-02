import 'dart:ui';
import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  static bool isHexColor(String input) {
    final hexColorRegExp =
        RegExp(r'^#([A-Fa-f0-9]{3}|[A-Fa-f0-9]{6}|[A-Fa-f0-9]{8})$');
    return hexColorRegExp.hasMatch(input);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
