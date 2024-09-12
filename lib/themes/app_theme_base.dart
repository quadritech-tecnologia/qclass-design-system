import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'responsive/responsive_extension.dart';

/// Configurações de fontFamily, Radius,Shadows, opacitys.
class AppThemeBase {
  static String get primaryFontFamily => 'Poppins';

  static double get lineHeightTight => 0.1;
  static double get lineHeightRegular => 1;
  static double get lineHeightMedium => 1.25;
  static double get lineHeightDistant => 1.5;
  static double get lineHeightSuperDistant => 2;

  static double get buttonHeight => 38.responsiveHeight;
  static double get buttonHeightSM => 32.responsiveHeight;
  static double get buttonHeightMD => 48.responsiveHeight;
  static double get buttonHeightLG => 56.responsiveHeight;

  static double get inputHeight => 38.responsiveHeight;
  static double get inputHeightSM => 28.responsiveHeight;
  static double get inputHeightMD => 48.responsiveHeight;
  static double get inputHeightLG => 56.responsiveHeight;

  /// Radius.circular(6);
  static Radius get radiusCircular => const Radius.circular(6);

  static BorderRadius get borderRadiusNone => BorderRadius.zero;

  /// BorderRadius.circular(4);
  static BorderRadius get borderRadiusXSM => BorderRadius.circular(4);

  /// BorderRadius.circular(8);
  static BorderRadius get borderRadiusSM => BorderRadius.circular(8);

  /// BorderRadius.circular(12);
  static BorderRadius get borderRadiusMD => BorderRadius.circular(12);

  /// BorderRadius.circular(20);
  static BorderRadius get borderRadiusLG => BorderRadius.circular(20);

  /// BorderRadius.circular(24);
  static BorderRadius get borderRadiusXLG => BorderRadius.circular(24);

  static double get borderWidthSM => 1.5.responsiveWidth;
  static double get borderWidthXS => 1.responsiveWidth;

  static double get opacityLevelSemiopaque => 0.8;
  static double get opacityLevelIntense => 0.64;
  static double get opacityLevelMedium => 0.32;
  static double get opacityLevelLight => 0.16;
  static double get opacityLevelSemiTransparent => 0.08;

  static BoxShadow get shadowLightmodeLevel0 => const BoxShadow(
        color: Color.fromRGBO(172, 186, 202, 0.1),
        blurRadius: 60,
        spreadRadius: 0,
        offset: Offset.zero,
      );
  static BoxShadow get shadowLightmodeLevel1 => const BoxShadow(
        color: Color.fromRGBO(120, 141, 150, 0.25),
        blurRadius: 4,
        spreadRadius: 0,
        offset: Offset.zero,
      );
  static BoxShadow get shadowLightmodeLevel2 => const BoxShadow(
        blurRadius: 24,
        offset: Offset(0, 8),
      );
  static BoxShadow get shadowLightmodeLevel3 => const BoxShadow(
        blurRadius: 32,
        offset: Offset(0, 16),
      );
  static BoxShadow get shadowLightmodeLevel4 => const BoxShadow(
        blurRadius: 18,
        offset: Offset(0, 16),
      );
  static BoxShadow get shadowLightmodeLevel5 => const BoxShadow(
        blurRadius: 8,
        offset: Offset(2, 0),
      );
  static BoxShadow get shadowLightmodeLevel6 => const BoxShadow(
        color: Color.fromRGBO(172, 186, 202, 0.035),
      );

  static double get appBarHeight => 60.responsiveHeight;
  static double get customRadioCircleSize => 15.fontSize;
  static double get disclaimerIconSize => 18.fontSize;
}
