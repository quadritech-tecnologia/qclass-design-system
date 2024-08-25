import 'package:design_system_qclass/themes/responsive/responsive_extension.dart';
import 'package:flutter/material.dart';

import '../../colors/app_colors_base.dart';
import '../../extensions/build_context_extensions.dart';
import '../../themes/app_theme_base.dart';
import '../../themes/spacing/spacing.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.child,
    required this.onTap,
    this.isEnabled = true,
  });

  final Function() onTap;
  final Widget child;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1 : .5,
      child: Semantics(
        button: isEnabled,
        child: InkWell(
          onTap: isEnabled ? onTap : null,
          borderRadius: AppThemeBase.borderRadiusSM,
          child: Padding(
            padding: EdgeInsets.only(right: const Spacing(3).value),
            child: SizedBox(
              height: const Spacing(3).value.responsiveHeight,
              child: Theme(
                data: context.theme.copyWith(
                  iconTheme: context.theme.iconTheme.copyWith(
                    color: AppColorsBase.neutrla7,
                  ),
                ),
                child: Center(child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
