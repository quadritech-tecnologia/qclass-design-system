import 'package:flutter/material.dart';

import '../responsive/responsive_extension.dart';

/// The recommended scaling factor for matterial is 8
/// See more https://medium.com/swlh/the-comprehensive-8pt-grid-guide-aa16ff402179
/// or https://material.io/design/layout/understanding-layout.html#layout-anatomy
const int _kDefaultSpacingFactor = 8;

///
/// Default app spacing sizes, considering responsiveness.
///
class Spacing {
  /// Extra small = 4
  static const xxs = Spacing(0.5);

  /// Extra small = 8
  static const xs = Spacing(1);

  /// Small = 16
  static const sm = Spacing(2);

  /// Medium = 24
  static const md = Spacing(3);

  /// Large = 32
  static const lg = Spacing(4);

  /// Extra large = 40
  static const xl = Spacing(5);

  /// Extra large = 48
  static const xxl = Spacing(6);

  /// Extra large = 64
  static const xxxl = Spacing(7);

  final double _val;

  /// Raw double value, without considering responsiveness.
  double get value => _val * factor;

  /// The scaling factor for gutters and margins
  final int factor;

  /// Default Spacing or keyboard padding
  static double orKeyboardPadding(BuildContext context, double value) =>
      MediaQuery.viewInsetsOf(context).bottom == 0
          ? value
          : MediaQuery.viewInsetsOf(context).bottom + value;

  /// Default [Spacing] constructor
  const Spacing(this._val, {this.factor = _kDefaultSpacingFactor});

  /// Binary subtraction operator.
  Spacing operator -(Spacing other) => Spacing(value - other.value);

  /// Binary addition operator.
  Spacing operator +(Spacing other) => Spacing(value + other.value);

  /// Multiplication operator.
  Spacing operator *(double operand) => Spacing(value * operand);
}

/// Add extension methods to [Spacing] handle responsiveness.
extension SpacingExt on Spacing {
  /// Current value with [responsiveWidth] extension
  double get width => value.responsiveWidth;

  /// Current value with [responsiveHeight] extension
  double get height => value.responsiveHeight;

  /// Builds a [SizedBox] with vertical spacing (using responsiveHeight)
  SizedBox get vertical => SizedBox(height: value.responsiveHeight);

  /// Builds a [SizedBox] with horizontal spacing (using responsiveWidth)
  SizedBox get horizontal => SizedBox(width: value.responsiveWidth);
}
