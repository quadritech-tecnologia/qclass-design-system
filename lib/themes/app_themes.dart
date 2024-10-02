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
        color: scheme.onSurface,
      ),
      bodyMedium: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.bodyMedium.value,
        fontWeight: AppFontWeight.regular.value,
        color: scheme.onSurface,
      ),
      bodySmall: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.bodySmall.value,
        fontWeight: AppFontWeight.regular.value,
        color: scheme.onSurface,
      ),
      titleLarge: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.titleLarge.value,
        fontWeight: AppFontWeight.bold.value,
        color: scheme.onSurface,
      ),
      titleMedium: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.titleMedium.value,
        fontWeight: AppFontWeight.bold.value,
        color: scheme.onSurface,
      ),
      titleSmall: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.titleSmall.value,
        fontWeight: AppFontWeight.bold.value,
        color: scheme.onSurface,
      ),
      displayLarge: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.displayLarge.value,
        fontWeight: AppFontWeight.regular.value,
        color: scheme.onSurface,
      ),
      displayMedium: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.displayMedium.value,
        fontWeight: AppFontWeight.regular.value,
        color: scheme.onSurface,
      ),
      displaySmall: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.displaySmall.value,
        fontWeight: AppFontWeight.regular.value,
        color: scheme.onSurface,
      ),
      headlineLarge: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.headlineLarge.value,
        fontWeight: AppFontWeight.bold.value,
        color: scheme.onSurface,
      ),
      headlineMedium: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.headlineMedium.value,
        fontWeight: AppFontWeight.regular.value,
        color: scheme.onSurface,
      ),
      headlineSmall: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.headlineSmall.value,
        fontWeight: AppFontWeight.regular.value,
        color: scheme.onSurface,
      ),
      labelLarge: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.labelLarge.value,
        fontWeight: AppFontWeight.light.value,
        color: scheme.onSurface,
      ),
      labelMedium: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.labelMedium.value,
        fontWeight: AppFontWeight.light.value,
        color: scheme.onSurface,
      ),
      labelSmall: TextStyle(
        fontFamily: AppThemeBase.primaryFontFamily,
        fontSize: AppFontSize.labelSmall.value,
        fontWeight: AppFontWeight.light.value,
        color: scheme.onSurface,
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
      surfaceContainer: Colors.white,
      surface: AppColorsBase.lightBackgroundColor,
      onSurface: AppColorsBase.darkBackgroundColor,
      onSurfaceVariant: AppColorsBase.info,
      surfaceContainerHighest: AppColorsBase.primary.withOpacity(.8),
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
      hoverColor: colorScheme.onSurface.withOpacity(.26),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.disabled)) {
            return colorScheme.onSurface.withOpacity(.46);
          } else if (state.contains(WidgetState.selected)) {
            return colorScheme.tertiary;
          }
          return AppColorsBase.black.withOpacity(.56);
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        side: BorderSide(color: AppColorsBase.black.withOpacity(.56)),
        fillColor: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.disabled)) {
            return colorScheme.onSurface.withOpacity(.46);
          } else if (state.contains(WidgetState.selected)) {
            return colorScheme.tertiary;
          }
          return colorScheme.surface;
        }),
      ),
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
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          iconColor: WidgetStatePropertyAll(AppColorsBase.white),
          iconSize: WidgetStatePropertyAll(AppFontSize.iconButton.value),
        ),
      ),
      splashColor: AppColorsBase.gray5,
      highlightColor: colorScheme.onSurface.withOpacity(.26),
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
      surface: AppColorsBase.darkBackgroundColor,
      onSurface: AppColorsBase.lightBackgroundColor,
      onSurfaceVariant: AppColorsBase.info,
      surfaceContainerHighest: AppColorsBase.primary.withOpacity(.8),
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
        color: colorScheme.onSurface,
        elevation: 0,
      ),
      iconTheme: IconThemeData(
        color: AppColorsBase.blue6,
        size: AppFontSize.iconButton.value,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          iconColor: WidgetStatePropertyAll(AppColorsBase.white),
          iconSize: WidgetStatePropertyAll(AppFontSize.iconButton.value),
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
