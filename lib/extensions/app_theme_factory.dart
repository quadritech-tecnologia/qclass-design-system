import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';

extension TextThemeExtension on TextTheme {
  ///Family: Poppins
  String get primaryFontFamily => AppThemeBase.primaryFontFamily;

  FontWeight get fontWeightBold => AppFontWeight.bold.value;
  FontWeight get fontWeightSemiBold => AppFontWeight.semiBold.value;
  FontWeight get fontWeightMedium => AppFontWeight.medium.value;
  FontWeight get fontWeightRegular => AppFontWeight.regular.value;
  FontWeight get fontWeightLight => AppFontWeight.light.value;
  double get lineHeightTight => AppThemeBase.lineHeightTight;
  double get lineHeightRegular => AppThemeBase.lineHeightRegular;
  double get lineHeightMedium => AppThemeBase.lineHeightMedium;
  double get lineHeightDistant => AppThemeBase.lineHeightDistant;
  double get lineHeightSuperDistant => AppThemeBase.lineHeightSuperDistant;
}

extension ThemeDataExtension on ThemeData {
  BorderRadius get borderRadiusNone => AppThemeBase.borderRadiusNone;
  BorderRadius get borderRadiusXSM => AppThemeBase.borderRadiusXSM;
  BorderRadius get borderRadiusSM => AppThemeBase.borderRadiusSM;
  BorderRadius get borderRadiusMD => AppThemeBase.borderRadiusMD;
  BorderRadius get borderRadiusLG => AppThemeBase.borderRadiusLG;

  double get borderWidthSM => AppThemeBase.borderWidthSM;
  double get borderWidthXS => AppThemeBase.borderWidthXS;
  double get opacityLevelSemiopaque => AppThemeBase.opacityLevelSemiopaque;
  double get opacityLevelIntense => AppThemeBase.opacityLevelIntense;
  double get opacityLevelMedium => AppThemeBase.opacityLevelMedium;
  double get opacityLevelLight => AppThemeBase.opacityLevelLight;
  double get opacityLevelSemiTransparent =>
      AppThemeBase.opacityLevelSemiTransparent;

  BoxShadow get shadowLightmodeLevel0 => AppThemeBase.shadowLightmodeLevel0;
  BoxShadow get shadowLightmodeLevel1 => AppThemeBase.shadowLightmodeLevel1;
  BoxShadow get shadowLightmodeLevel2 => AppThemeBase.shadowLightmodeLevel2;
  BoxShadow get shadowLightmodeLevel3 => AppThemeBase.shadowLightmodeLevel3;
  BoxShadow get shadowLightmodeLevel4 => AppThemeBase.shadowLightmodeLevel4;
  BoxShadow get shadowLightmodeLevel5 => AppThemeBase.shadowLightmodeLevel5;

  double get customRadioCircleSize => AppThemeBase.customRadioCircleSize;
  double get disclaimerIconSize => AppThemeBase.disclaimerIconSize;

  Border get borderZero => Border.all(width: 0, color: Colors.transparent);
}

extension InputDecorationThemeExtension on InputDecorationTheme {
  TextStyle? get floatingLabelStyle => labelStyle?.copyWith(
        height: AppThemeBase.lineHeightTight,
        fontWeight: AppFontWeight.bold.value,
      );
}

extension ElevatedButtonThemeDataExtension on ElevatedButtonThemeData {
  double get heightDefault => AppThemeBase.buttonHeight;
  double get heightSmall => AppThemeBase.buttonHeightSM;
  double get heightMedium => AppThemeBase.buttonHeightMD;
  double get heightLarge => AppThemeBase.buttonHeightLG;
}

extension AppBarThemeExtension on AppBarTheme {
  double get appBarHeight => AppThemeBase.appBarHeight;
}

class AppThemeFactory {
  AppThemeFactory._();
  static final AppThemeFactory _instance = AppThemeFactory._();
  static AppThemeFactory get instance => _instance;

  ThemeData? _currentLightTheme;
  ThemeData get currentLightTheme {
    _currentLightTheme ??= ThemeData();
    return _currentLightTheme!;
  }

  set currentLightTheme(ThemeData value) {
    _currentLightTheme = value;
  }

  ThemeData? _currentDarkTheme;
  ThemeData get currentDarkTheme {
    _currentDarkTheme ??= ThemeData();
    return _currentDarkTheme!;
  }

  set currentDarkTheme(ThemeData value) {
    _currentDarkTheme = value;
  }
}
