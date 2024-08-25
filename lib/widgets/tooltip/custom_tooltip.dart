import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';

class CustomTooltip extends StatelessWidget {
  const CustomTooltip({
    super.key,
    required this.message,
    required this.child,
    this.triggerMode,
  });

  final String message;
  final Widget child;
  final TooltipTriggerMode? triggerMode;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      verticalOffset: const Spacing(5).value.responsiveHeight,
      excludeFromSemantics: true,
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        borderRadius: AppThemeBase.borderRadiusSM,
        border: Border.all(
          color: AppColorsBase.neutrla1,
          width: AppThemeBase.lineHeightRegular,
        ),
        boxShadow: [AppThemeBase.shadowLightmodeLevel1],
      ),
      textStyle: context.textTheme.bodyMedium?.copyWith(
        fontWeight: AppFontWeight.medium.value,
      ),
      enableFeedback: true,
      triggerMode: triggerMode,
      child: child,
    );
  }
}
