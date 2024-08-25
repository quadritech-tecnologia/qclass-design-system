import 'package:design_system_qclass/themes/responsive/responsive_extension.dart';
import 'package:flutter/material.dart';

enum AppFontWeight {
  bold(FontWeight.bold),
  semiBold(FontWeight.w600),
  medium(FontWeight.w500),
  regular(FontWeight.w400),
  light(FontWeight.w300);

  final FontWeight value;
  const AppFontWeight(this.value);
}

enum AppLineHeight {
  xs(0.5),
  sm(1),
  md(1.5),
  lg(2);

  final double value;
  const AppLineHeight(this.value);
}

enum AppFontSize {
  bodyLarge(16),
  bodyMedium(14),
  bodySmall(12),
  titleLarge(22),
  titleMedium(18),
  titleSmall(14),
  displayLarge(57),
  displayMedium(45),
  displaySmall(36),
  headlineLarge(32),
  headlineMedium(28),
  headlineSmall(24),
  labelLarge(14),
  labelMedium(12),
  labelSmall(11),
  iconButton(24);

  final int _value;
  const AppFontSize(this._value);
  double get value => _value.fontSize;
}
