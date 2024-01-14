import 'package:bigio_test/component/theme/color_system.dart';
import 'package:flutter/material.dart';

class TextSystem {
  TextSystem._();

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: ColorSystem.black,
    height: 1.2,
  );
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.bold,
    fontSize: 20,
    letterSpacing: 0.27,
    color: ColorSystem.black,
    height: 1.2,
  );
  static const TextStyle headlineSmall = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.27,
    color: ColorSystem.black,
    height: 1.2,
  );
  static const TextStyle titleLarge = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: ColorSystem.black,
    height: 1.2,
  );
  static const TextStyle titleMedium = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.bold,
    fontSize: 14,
    letterSpacing: 0.18,
    color: ColorSystem.black,
    height: 1.2,
  );
  static const TextStyle titleSmall = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.bold,
    fontSize: 12,
    letterSpacing: 0.18,
    color: ColorSystem.black,
    height: 1.2,
  );
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.18,
    color: ColorSystem.black,
    height: 1.2,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.18,
    color: ColorSystem.black,
    height: 1.2,
  );
  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.18,
    color: ColorSystem.black,
    height: 1.2,
  );
  static const TextStyle labelLarge = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.18,
    color: ColorSystem.black,
    height: 1.2,
  );
  static const TextStyle labelMedium = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.18,
    color: ColorSystem.black,
    height: 1.2,
  );
  static const TextStyle labelSmall = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.18,
    color: ColorSystem.black,
    height: 1.2,
  );
}

enum EditMode { ADD, UPDATE }
