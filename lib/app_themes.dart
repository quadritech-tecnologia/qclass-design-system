import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static TextTheme _textTheme(ColorScheme scheme) {
    return TextTheme(
      bodyLarge: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.bodyLarge.value,
        fontWeight: AppFontWeight.regular.value,
        color: scheme.onBackground,
      ),
      bodyMedium: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.bodyMedium.value,
        fontWeight: AppFontWeight.regular.value,
        color: scheme.onBackground,
      ),
      bodySmall: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.bodySmall.value,
        fontWeight: AppFontWeight.regular.value,
        color: scheme.onBackground,
      ),
      titleLarge: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.titleLarge.value,
        fontWeight: AppFontWeight.bold.value,
        color: scheme.onBackground,
      ),
      titleMedium: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.titleMedium.value,
        fontWeight: AppFontWeight.bold.value,
        color: scheme.onBackground,
      ),
      titleSmall: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.titleSmall.value,
        fontWeight: AppFontWeight.bold.value,
        color: scheme.onBackground,
      ),
      displayLarge: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.displayLarge.value,
        fontWeight: AppFontWeight.regular.value,
        color: scheme.onBackground,
      ),
      displayMedium: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.displayMedium.value,
        fontWeight: AppFontWeight.regular.value,
        color: scheme.onBackground,
      ),
      displaySmall: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.displaySmall.value,
        fontWeight: AppFontWeight.regular.value,
        color: scheme.onBackground,
      ),
      headlineLarge: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.headlineLarge.value,
        fontWeight: AppFontWeight.bold.value,
        color: scheme.onBackground,
      ),
      headlineMedium: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.headlineMedium.value,
        fontWeight: AppFontWeight.regular.value,
        color: scheme.onBackground,
      ),
      headlineSmall: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.headlineSmall.value,
        fontWeight: AppFontWeight.regular.value,
        color: scheme.onBackground,
      ),
      labelLarge: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.labelLarge.value,
        fontWeight: AppFontWeight.light.value,
        color: scheme.onBackground,
      ),
      labelMedium: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.labelMedium.value,
        fontWeight: AppFontWeight.light.value,
        color: scheme.onBackground,
      ),
      labelSmall: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.labelSmall.value,
        fontWeight: AppFontWeight.light.value,
        color: scheme.onBackground,
      ),
    );
  }

  static ThemeData createLightTheme() {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColorsBase.primary,
      onPrimary: AppColorsBase.lightBackgroundColor,
      primaryContainer: AppColorsBase.white,
      onPrimaryContainer: AppColorsBase.primary,
      secondary: AppColorsBase.secondary,
      onSecondary: AppColorsBase.secondary,
      onSecondaryContainer: AppColorsBase.white,
      secondaryContainer: AppColorsBase.secondary,
      tertiary: AppColorsBase.tertiary,
      onTertiary: AppColorsBase.tertiary,
      tertiaryContainer: AppColorsBase.tertiary,
      onTertiaryContainer: AppColorsBase.tertiary,
      error: AppColorsBase.danger,
      onError: AppColorsBase.danger,
      errorContainer: AppColorsBase.danger,
      onErrorContainer: const Color(0xFFFFE1E2),
      background: AppColorsBase.lightBackgroundColor,
      onBackground: AppColorsBase.primary,
      surface: AppColorsBase.primary,
      onSurface: AppColorsBase.lightBackgroundColor,
      onSurfaceVariant: AppColorsBase.info,
      surfaceVariant: AppColorsBase.primary.withOpacity(.8),
      outline: const Color(0xFFD6F6FF),
      onInverseSurface: const Color(0xFF78767F),
      inverseSurface: const Color(0xFFC8BFFF),
      inversePrimary: const Color(0xFF00363F),
      shadow: AppColorsBase.primary.withOpacity(.8),
      surfaceTint: const Color(0xFFC9C9C9),
      outlineVariant: const Color(0xFF666666),
      scrim: AppColorsBase.white,
    );

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        surfaceTintColor: AppColorsBase.white,
        shadowColor: Colors.transparent,
        color: colorScheme.primary,
        elevation: 0,
      ),
      iconTheme: IconThemeData(
        color: AppColorsBase.white,
        size: AppFontSize.iconButton.value,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColorsBase.info),
          iconColor: MaterialStatePropertyAll(AppColorsBase.white),
          iconSize: MaterialStatePropertyAll(AppFontSize.iconButton.value),
        ),
      ),
      splashColor: AppColorsBase.tertiary,
      highlightColor: AppColorsBase.tertiary,
      shadowColor: AppColorsBase.secondary,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColorsBase.lightBackgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: _textTheme(colorScheme),
    );
  }

  static ThemeData createDarkTheme() {
    final colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColorsBase.primary,
      onPrimary: AppColorsBase.lightBackgroundColor,
      primaryContainer: AppColorsBase.white,
      onPrimaryContainer: AppColorsBase.primary,
      secondary: AppColorsBase.secondary,
      onSecondary: AppColorsBase.secondary,
      onSecondaryContainer: AppColorsBase.white,
      secondaryContainer: AppColorsBase.secondary,
      tertiary: AppColorsBase.tertiary,
      onTertiary: AppColorsBase.tertiary,
      tertiaryContainer: AppColorsBase.tertiary,
      onTertiaryContainer: AppColorsBase.tertiary,
      error: AppColorsBase.danger,
      onError: AppColorsBase.danger,
      errorContainer: AppColorsBase.danger,
      onErrorContainer: const Color(0xFFFFE1E2),
      background: AppColorsBase.primary,
      onBackground: AppColorsBase.white,
      surface: AppColorsBase.primary,
      onSurface: AppColorsBase.lightBackgroundColor,
      onSurfaceVariant: AppColorsBase.info,
      surfaceVariant: AppColorsBase.primary.withOpacity(.8),
      outline: const Color(0xFFD6F6FF),
      onInverseSurface: const Color(0xFF78767F),
      inverseSurface: const Color(0xFFC8BFFF),
      inversePrimary: const Color(0xFF00363F),
      shadow: AppColorsBase.primary.withOpacity(.8),
      surfaceTint: const Color(0xFFC9C9C9),
      outlineVariant: const Color(0xFF666666),
      scrim: AppColorsBase.white,
    );

    final themeData = createLightTheme();

    return themeData.copyWith(
      brightness: Brightness.dark,
      primaryColor: AppColorsBase.primary,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        color: colorScheme.onBackground,
        elevation: 0,
      ),
      iconTheme: IconThemeData(
        color: AppColorsBase.neutrla7,
        size: AppFontSize.iconButton.value,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColorsBase.info),
          iconColor: MaterialStatePropertyAll(AppColorsBase.white),
          iconSize: MaterialStatePropertyAll(AppFontSize.iconButton.value),
        ),
      ),
      splashColor: AppColorsBase.info,
      highlightColor: AppColorsBase.info,
      shadowColor: Colors.transparent,
      colorScheme: colorScheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColorsBase.primary,
      textTheme: _textTheme(colorScheme),
    );
  }
}
