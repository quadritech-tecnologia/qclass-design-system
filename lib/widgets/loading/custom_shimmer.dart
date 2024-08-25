import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../colors/app_colors_base.dart';
import '../../extensions/build_context_extensions.dart';
import '../../themes/app_theme_base.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.borderRadius,
  });

  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorsBase.grey21,
      highlightColor: AppColorsBase.grey23,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.background,
          borderRadius: borderRadius ?? AppThemeBase.borderRadiusXSM,
        ),
        width: width,
        height: height,
      ),
    );
  }
}
