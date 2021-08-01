import 'package:flutter/material.dart';

class MovieDBAppTheme {
  MovieDBAppTheme._();

  static const Color primaryColor = Color(0xFF17262A);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFB4B4B4);

}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}