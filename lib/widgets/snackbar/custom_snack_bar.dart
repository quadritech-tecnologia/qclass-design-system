import 'package:auto_size_text/auto_size_text.dart';
import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showMessage({
    required String title,
    required BuildContext context,
    Widget? content,
    TextStyle? textStyle,
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.fixed,
        shape: RoundedRectangleBorder(
          borderRadius: context.theme.borderRadiusSM,
        ),
        padding: EdgeInsets.zero,
        elevation: 0,
        clipBehavior: Clip.none,
        dismissDirection: DismissDirection.up,
        backgroundColor: Colors.transparent,
        content: content ??
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Spacing.sm.value,
                vertical: Spacing.xs.value,
              ),
              color: isError ? AppColorsBase.error : AppColorsBase.success,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isError
                        ? Icons.error_outline_rounded
                        : Icons.check_circle_outline_rounded,
                    size: AppFontSize.iconButton.value,
                    color: context.colorScheme.onPrimary,
                  ),
                  Spacing.sm.horizontal,
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          title,
                          group: AutoSizeGroup(),
                          minFontSize: AppFontSize.bodySmall.value,
                          maxFontSize: AppFontSize.bodyMedium.value,
                          style: textStyle ??
                              context.textTheme.bodySmall?.copyWith(
                                color: context.colorScheme.onPrimary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
