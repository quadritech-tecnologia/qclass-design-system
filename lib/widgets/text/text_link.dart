import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  const TextLink({
    super.key,
    required this.text,
    this.underline = false,
    this.isEnabled = true,
    this.onTap,
    this.icon,
    this.styleText,
  });

  final Function()? onTap;
  final String text;
  final bool underline;
  final bool isEnabled;
  final IconData? icon;
  final TextStyle? styleText;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled && onTap != null ? 1 : .5,
      child: Semantics(
        button: true,
        child: InkWell(
          onTap: isEnabled ? onTap : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurface,
                    decorationColor: context.colorScheme.primary,
                    fontWeight: context.textTheme.fontWeightMedium,
                    decoration: underline ? TextDecoration.underline : null,
                  ),
                ),
              ),
              if (icon != null) ...[
                Spacing.xxs.horizontal,
                Icon(
                  icon,
                  color: context.colorScheme.primary,
                  size: AppFontSize.bodyMedium.value,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
