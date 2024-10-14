import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';

/// Close dialog button
class CloseDialogButton extends StatelessWidget {
  const CloseDialogButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Spacing.xs.value),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Spacing.xxs.value),
        child: ColoredBox(
          color: const Color(0xFFE9E9E9),
          child: Padding(
            padding: EdgeInsets.all(Spacing.xs.value),
            child: Icon(
              Icons.close,
              size: 24,
              color: const Color(0xFF343A40).withOpacity(.56),
            ),
          ),
        ),
      ),
    );
  }
}
