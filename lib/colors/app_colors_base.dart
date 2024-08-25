import 'package:flutter/material.dart';

abstract class AppColorsBase {
  // cores
  static Color get primary => const Color(0xFF1A2131);
  static Color get secondary => const Color(0xFF333C4E);
  static Color get tertiary => const Color(0xFF298CF4);
  static Color get white => const Color(0xFFFCFEFF);
  static Color get info => const Color(0xFFC66C61);
  static Color get warning => const Color(0xFFFCBA43);
  static Color get danger => const Color(0xFFAC4450);
  static Color get success => const Color(0xFF29BB89);

  // Background colors
  static Color lightBackgroundColor = white;
  static Color darkBackgroundColor = primary;

  // colors
  static Color get kGray => const Color(0xFFc2c7cf);
  static Color get kBlack => Colors.black;
  static Color get reddd => Colors.red;
  static Color get errorColor => danger;
  static Color get error => danger;
  static Color get lighterError => const Color(0xffffe1e2);

  // Grays
  static Color get grey0 => const Color(0xFFCCCED0);
  static Color get grey1 => const Color(0xFFe1f2f9);
  static Color get grey2 => const Color(0xFFFAFAFA);
  static Color get grey3 => const Color(0xFFDBDBDB);
  static Color get grey4 => const Color(0xFF7A828A);
  static Color get grey5 => const Color(0xFF3E424F);
  static Color get grey6 => const Color(0xFF777777);
  static Color get grey7 => const Color(0xFFB9B9B9);
  static Color get grey8 => const Color(0xFF808080);
  static Color get grey9 => const Color(0xFF212121);
  static Color get grey10 => const Color(0xFF353535);
  static Color get grey11 => const Color(0xFF828282);
  static Color get grey12 => const Color(0xFFDBDBDB);
  static Color get grey19 => const Color(0xFF4E4B59);
  static Color get grey20 => const Color(0xff666666);
  static Color get grey21 => const Color(0x87E7E4E4);
  static Color get grey22 => const Color(0x87FFFFFF);
  static Color get grey23 => const Color(0xA2D7D2D2);
  static Color get grey24 => const Color(0x4F4E4E4E);
  static Color get grey25 => const Color(0xAB4E4E4E);
  static Color get grey26 => const Color(0xfff7f6fc);

  // Neutrals
  static Color get neutrla0 => const Color(0xFFFCFCFC);
  static Color get neutrla1 => const Color(0xFFF5F5F5);
  static Color get neutrla2 => const Color(0xFFF1F1F1);
  static Color get neutrla3 => const Color(0xFFC9C9C9);
  static Color get neutrla4 => const Color(0xFF979797);
  static Color get neutrla5 => const Color(0xFF666666);
  static Color get neutrla6 => const Color(0xFF333333);
  static Color get neutrla7 => const Color(0xFF181818);
  static Color get neutrla8 => const Color(0xFFACBACA);
}
