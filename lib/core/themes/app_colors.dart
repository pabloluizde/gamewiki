import 'package:flutter/material.dart';

class AppColors {
  static String blackDefault = '#0D0D13';
  static String purpleNeon = '#9F00EA';
  static String darkBlue = '#131F35';
  static String darkPurple = '#310063';

  static Color blackDefaultColor = HexColor.fromHex(blackDefault);
  static Color purpleNeonColor = HexColor.fromHex(purpleNeon);
  static Color darkBlueColor = HexColor.fromHex(darkBlue);
  static Color darkPurpleColor = HexColor.fromHex(darkPurple);
  static Color greenSuccess = const Color.fromARGB(255, 33, 246, 100);
  static Color redError = const Color.fromARGB(255, 251, 34, 34);
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
