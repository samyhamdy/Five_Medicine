// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class AppColors {
  static Color primarycolor = HexColor("#0455AC");
  static Color black = HexColor("#020C32");
  static Color white = HexColor("#FFFFFF");
  static Color hintcolor = HexColor("#A6A6A6");
  static Color bodyColor = HexColor("#343843");
  static Color red = Colors.red;
  static Color borderColor = HexColor("#FAFAFA");
  static Color diseasecontentColor = HexColor("#0455AC");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
