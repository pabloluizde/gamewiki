import 'package:flutter/material.dart';

class AppColors {
  static String blackDefault = '#0D0D13';
  static String purpleNeon = '#9F00EA';

  static Color blackDefaultColor = HexColor.fromHex(blackDefault);
  static Color purpleNeonColor = HexColor.fromHex(purpleNeon);
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
